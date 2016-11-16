class Event < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	acts_as_taggable

	belongs_to :join
	has_many :comments, dependent: :destroy

end
