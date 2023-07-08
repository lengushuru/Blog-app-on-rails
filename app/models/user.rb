class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, class_name: 'Post', foreign_key: :author_id
  has_many :comments, class_name: 'Comment', foreign_key: :author_id
  has_many :likes, class_name: 'Like', foreign_key: :author_id

  validates :name, presence: true

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end
end