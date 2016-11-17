class Event < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	acts_as_taggable
  belongs_to :event
	has_many :joins, dependent: :destroy
	has_many :comments, dependent: :destroy

  def joined_by? user
    joins.where(user_id: user.id).exists?
  end
  	validates :title, presence: true
  	validates :capacity, presence: true

end
