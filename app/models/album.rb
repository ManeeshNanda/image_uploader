class Album < ApplicationRecord
	has_many :images
	belongs_to :user, :class_name => "User", :foreign_key => :user_id
end
