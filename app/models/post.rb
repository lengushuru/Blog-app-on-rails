class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: :post_id
  has_many :likes, class_name: 'Like', foreign_key: :post_id

  after_create :update_user_posts_counter

  def update_user_posts_counter
    author.increment!(:post_counter)
  end

  def latest_commments
    comments.order(create_at: :desc).limit(5)
  end
end
