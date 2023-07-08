class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  has_many :comments, class_name: 'Comment', foreign_key: :post_id
  has_many :likes, class_name: 'Like', foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }

  # validates :comments_counter, numericality: { only_integer: true }

  # validates :likes_counters, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_user_posts_counter

  def latest_commments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    user.increment!(:posts_counter)
  end
end
