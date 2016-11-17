class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  has_many :replies
<<<<<<< HEAD
  validates :title, presence: true

  def add_error_sample
    if title.empty?
      errors.add(:title, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
=======
  acts_as_taggable_on :labels
  acts_as_ordered_taggable_on :interests
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
>>>>>>> 7d79295f92e03f882b0bcb27d7adec0af8b56db1
end
