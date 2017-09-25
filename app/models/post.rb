class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  has_many :replies
  acts_as_taggable_on :labels
  acts_as_ordered_taggable_on :interests
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
end
