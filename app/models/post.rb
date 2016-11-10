class Post < ActiveRecord::Base
  has_many :replies
  acts_as_taggable_on :labels
  acts_as_ordered_taggable_on :interests
  validates :title, presence: true
end
