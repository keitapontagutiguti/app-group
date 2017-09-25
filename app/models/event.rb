class Event < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
	mount_uploader :image, ImageUploader

	acts_as_taggable
  belongs_to :event
	has_many :joins, dependent: :destroy
	has_many :comments, dependent: :destroy

  def joined_by? user
    joins.where(user_id: user.id).exists?
  end

  	validates :title, presence: true, length: {maximum: 100}
  	validates :body, length: {maximum: 500}
  	validates :area, length: {maximum: 150}
  	validates :capacity, presence: true, numericality: {only_integer: true}, numericality: {greater_than: 0}
  	validates :tags, length: {maximum: 100}
end
