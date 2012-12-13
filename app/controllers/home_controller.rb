class HomeController < ApplicationController

  before_filter :authenticate_user!, :only=>[:general_info]#:except => [:contact,:index,:location,:captcha,:switch_location] 
  before_filter :preferences, :only => [:index,:general]
  before_filter :unsigned_user, :only=>[:index]


  def index
    location = user_location(nil)
    
   
    @addr = ""
    @zip = ""

    if location
    loc_info = location[0].try(:data)
    logger.debug(loc_info)
    unless loc_info.nil?
      @addr = "#{loc_info['city']}, #{loc_info['region_code']}" 
      @zip = loc_info['zip_code']
    end
    
    end
     if !user_signed_in? || true
     render :layout=>'login'
   
    else
      render 'dashboard'       
    end 
  end

  def general_info
    @is_confirmed = current_user.confirmed?
    @has_photo = current_user.photo_file_name.present?
    @has_prefs = !current_user.preference.nil?
    @has_fb = current_user.uid.present?
    @percent_complete = 0;
    @percent_complete +=25 if @is_confirmed
    @percent_complete +=25 if @has_photo
    @percent_complete +=25 if @has_prefs 
    @percent_complete +=25 if @has_fb 
  end
  
  def about;end

  def info;end

  def contact;end

  def send_email
    
    if params[:email].blank?
        flash[:notice] = "Please enter a valid email address"
        redirect_to contact_path
    else
     
     puts "************************************"
     puts params
     puts "*************************************"
    
     NotificationMailer.contact_us(params[:name], params[:email], params[:subject], params[:body]).deliver
     flash[:notice] = "You're email has been sent"
    redirect_to contact_path
    end
  end
  
  def captcha
    render layout=> false
  end
  
  def switch_location
    zip = params["zip_code"]
     puts zip
     puts params
    unless zip.nil?
      puts zip
      arr = Geocoder.search(zip)
      data = arr[0].data
      #[#<Geocoder::Result::Google:0x4cf4e08 @data={"address_components"=>[{"long_name"=>"27705", "short_name"=>"27705", "types"=>["postal_code"]}, {"long_name"=>"Durham", "short_name"=>"Durham", "types"=>["locality", "political"]}, {"long_name"=>"North Carolina", "short_name"=>"NC", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"United States", "short_name"=>"US", "types"=>["country", "political"]}], "formatted_address"=>"Durham, NC 27705, USA", "geometry"=>{"bounds"=>{"northeast"=>{"lat"=>36.1059459, "lng"=>-78.90533789999999}, "southwest"=>{"lat"=>35.952911, "lng"=>-79.04770599999999}}, "location"=>{"lat"=>36.025609, "lng"=>-78.9853813}, "location_type"=>"APPROXIMATE", "viewport"=>{"northeast"=>{"lat"=>36.1059459, "lng"=>-78.90533789999999}, "southwest"=>{"lat"=>35.952911, "lng"=>-79.04770599999999}}}, "types"=>["postal_code"]}, @cache_hit=nil>]
      zip = data["address_components"][0]["long_name"]
      addr = data["formatted_address"]     
      addr = addr.sub(/\d+.*$/,"")
      res = {:zip=>zip,:address=>addr}
      logger.debug data
      render :json=>res.to_json
    else
      render :json=>"fail".to_json ,:status => :failure
    end  
  end


  protected

  def preferences
    @user_preference = current_user.preference.present? ? current_user.preference :  current_user.build_preference if user_signed_in?
  end

end
