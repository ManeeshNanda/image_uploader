class Image < ApplicationRecord
	belongs_to :album, :class_name => "Album", :foreign_key => :album_id
	belongs_to :user, :class_name => "User", :foreign_key => :user_id

	mount_uploader :image_url, AvatarUploader
	# validates_processing_of :image_url
	# validate :image_size_validation
 
	# private
 #  def image_size_validation
 #    errors[:image_url] << "should be less than 500KB" if image_url.size > 0.5.megabytes
 #  end
end
