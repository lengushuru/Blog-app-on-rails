class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  attribute :text, :text
  after_create :update_post_comments_counter
  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
