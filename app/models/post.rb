class Post < ActiveRecord::Base
  has_many :replies
  validates :title, presence: true

  def add_error_sample
    if title.empty?
      errors.add(:title, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
end
