require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  let!(:users) do
    User.create([{ name: 'captain', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'Software Engineer from nairobi', posts_counter: 0 },
                 { name: 'patel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'assistant database admin at dlight', posts_counter: 0 },
                 { name: 'charles', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'Fullstack developer', posts_counter: 0 }])
  end
  let!(:posts) do
    Post.create!([{ user: users[0], title: 'First Post', text: 'My first post', comments_counter: 0,
                    likes_counters: 0 },
                  { user: users[1], title: 'Second Post', text: 'My Second post', comments_counter: 0,
                    likes_counters: 0 },
                  { user: users[2], title: 'Third Post', text: 'My Third post', comments_counter: 0,
                    likes_counters: 0 }])
  end

  describe 'Post index' do
    it 'shows user profile picture' do
      visit user_posts_path(users[0])
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
    it 'shows user name' do
      visit user_posts_path(users[0])
      expect(page).to have_content(users[0].name)
    end

    it 'shows a post title' do
      visit user_posts_path(users[0])
      expect(page).to have_content(posts[0].title)
    end

    it 'shows some of a post body' do
      visit user_posts_path(users[0])
      expect(page).to have_content(posts[0].text)
    end

    it 'shows the first comment on a post' do
      Comment.create!(author: users[0], post: posts[0], text: 'niceeee')
      visit user_posts_path(users[0])
      expect(page).to have_content(posts[0].comments[0].text)
    end

    it 'shows how many comments a post has' do
      Comment.create!(author: users[0], post: posts[0], text: 'niceeee')
      Comment.create!(author: users[1], post: posts[0], text: 'amazing')
      visit user_posts_path(users[0])
      expect(page).to have_content(posts[0].comments_counter)
    end
    it 'shows how many likes a post has' do
      Like.create!(author: users[0], post: posts[0])
      visit user_posts_path(users[0])
      expect(page).to have_content(posts[0].likes_counters)
    end
    it 'shows pagination section' do
      visit user_posts_path(users[0])
      expect(page).to have_content('Pagination')
    end
    it 'When click on a post, it redirects to that post show page' do
      visit user_posts_path(users[0])
      click_link('First Post')
      expect(page).to have_current_path(user_post_path(users[0], posts[0]))
      expect(page).to have_content('My first post')
    end
  end
end
