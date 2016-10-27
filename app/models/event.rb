class Event < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	belongs_to :join
	has_many :comments, dependent: :destroy
end
