class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	has_attached_file :image,
            :styles => { :medium => "x300", :thumb => "x100" },
            :storage => :s3,
            :bucket => ENV['S3_BUCKET_NAME'],
            :s3_credentials => {:access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET']}
end
