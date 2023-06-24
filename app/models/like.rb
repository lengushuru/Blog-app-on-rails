class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_create :update_post_likes_counter

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
