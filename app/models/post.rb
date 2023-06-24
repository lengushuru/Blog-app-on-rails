class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :comments, class_name: 'Comment', foreign_key: :post_id
    has_many :likes, class_name: 'Like', foreign_key: :post_id

    after_create :update_user_posts_counter
    
    def update_user_posts_counter
        author.increment!(:post_counter)
    end
end

