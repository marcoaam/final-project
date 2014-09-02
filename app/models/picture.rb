class Picture < ActiveRecord::Base

	belongs_to :property
	
	has_attached_file :image,
	styles: {medium: "300x300#"},
  	:storage => :s3,
  	:s3_credentials => {
    	:bucket => 'getaroom',
    	:access_key_id => Rails.application.secrets.s3_access_key_id,
    	:secret_access_key => Rails.application.secrets.s3_secret_access_key
  }


	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 #do_not_validate_attachment_file_type :image
end

=begin
	
,
					:path => ":rails_root/public/images/:id/:filename",
    			:url  => "/images/:id/:filename"



	styles: {medium: "300x300#"},
  	:storage => :s3,
  	:s3_credentials => {
    	:bucket => 'getaroom',
    	:access_key_id => Rails.application.secrets.s3_access_key_id,
    	:secret_access_key => Rails.application.secrets.s3_secret_access_key
  }

	
=end