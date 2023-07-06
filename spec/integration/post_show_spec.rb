require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  let!(:users) do
    User.create!([{ name: 'kimani', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Engineer.',
                   posts_counter: 0 },
                 { name: 'charles', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from kakamega.',
                   posts_counter: 0 },
                 { name: 'patel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from kenya.',
                   posts_counter: 0 }])
  end

  let!(:posts) do
    Post.create!([{ user: users[0], title: 'First Post', text: 'My first post',
                    likes_counters: 0 },
                  { user: users[1], title: 'Second Post', text: 'My Second post',
                    likes_counters: 0 },
                  { user: users[2], title: 'Third Post', text: 'My Third post',
                    likes_counters: 0 }])
  end

  describe 'Post show' do
    it 'shows the title of a post' do
      visit user_post_path(users[0], posts[0])
      expect(page).to have_content(posts[0].title)
    end

    it 'shows how many comments a post has' do
      Comment.create!(author: users[0], post: posts[0], text: 'Very Good')
      Comment.create!(author: users[1], post: posts[0], text: 'Very Good')
      Comment.create!(author: users[2], post: posts[0], text: 'Very Good')
      visit user_post_path(users[0], posts[0])
      expect(page).to have_content(posts[0].comments_counter)
    end
    it 'shows how many likes a post has' do
      Like.create!(author: users[0], post: posts[0])
      Like.create!(author: users[1], post: posts[0])
      Like.create!(author: users[2], post: posts[0])
      visit user_post_path(users[0], posts[0])
      expect(page).to have_content(posts[0].likes_counters)
    end

    it 'shows the post body' do
      visit user_post_path(users[0], posts[0])
      expect(page).to have_content(posts[0].text)
    end

    it 'shows the username of each commentor' do
      Comment.create!(author: users[0], post: posts[0], text: 'Very nice')
      visit user_post_path(users[0], posts[0])

      posts[0].comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'shows the comment each commentor left' do
      Comment.create!(author: users[0], post: posts[0], text: 'Very nice')
      Comment.create!(author: users[2], post: posts[0], text: 'good')
      visit user_post_path(users[0], posts[0])

      posts[0].comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
