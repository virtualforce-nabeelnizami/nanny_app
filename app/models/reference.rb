class Reference < ActiveRecord::Base
	belongs_to :user
	has_many :reference_types, :dependent => :destroy

	def private_description
		if self.private == true 
			"published in profile"
		else
			"upon request only"
		end
	end

	def reference_types_text
		profiles = []

		if self.reference_types.blank? == false && self.reference_types.first.name == 'ga'
			'General References (All Services)'
		else
			self.reference_types.each do |r|
				profiles << ReferenceType::PROFILE_TYPES.map{ |k,v| v == r.name ? k : nil }.compact
			end
			profiles.map! { |r| r }.join(",")
		end
	end
end