class User < ActiveRecord::Base
   #has_attached_file :photo,:url => "/assets/photos/:id/:style/:basename.:extension"

   attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
   attr_accessible :photo,:zip_code, :crop_x, :crop_y, :crop_w, :crop_h, :role
   after_update :reprocess_photo, :if => :cropping?
   
   has_many :user_roles, :dependent => :destroy
   has_many :roles  ,:through => :user_roles
   has_many :languages
   has_many :availabilities
   has_many :references   
   has_one :education
   has_one :user_detail
   has_one :preference, :dependent=>:destroy
   has_one :babysitter_profile, :dependent=>:destroy

   PROVIDER = 1
   CARE_SEEKER = 2

  has_attached_file :photo,
    :styles => {:small  => "150x150#", :large => "500x500>"},
    :url => "/avatars/:basename_:style.:extension",
    :processors => [:cropper]


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:roles_mask,:full_name,:first_name, :last_name,

    :zipcode, :provider, :uid, :street_address, :city, :state, :phone_number, :date_of_birth, :religion, :show_phone, 
    :preference_attributes, :education_attributes, :languages_attributes, :user_detail_attributes, :availabilities_attributes, 
    :interests

  attr_accessor :update_preferences, :languages_attributes, :availabilities_attributes

  accepts_nested_attributes_for :preference, :education, :languages, :user_detail
  accepts_nested_attributes_for :availabilities, :allow_destroy => true
  
   validates_presence_of   :full_name
  # validates_confirmation_of :password, :if => :password_required
  validates :email,:presence => {:message => " is in use "}, :allow_blank => true,:uniqueness => { :case_sensitive => true }
  # validates_presence_of :street_address, :city, :state, :zip_code, :phone_number, :date_of_birth, :on => :update
    
  def has_photo
     !photo_file_name.nil?
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:uid => auth.uid).first
    unless user
      user = User.create(full_name:auth.extra.raw_info.name,
         uid=>auth.uid,
         first_name=> auth.info.first_name,
         last_name=> auth.info.first_name,
         email=>auth.info.email,
         password=>Devise.friendly_token[0,20]
       )
    end
    user
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
  end

  private
  def reprocess_photo
    photo.reprocess!
  end
end
