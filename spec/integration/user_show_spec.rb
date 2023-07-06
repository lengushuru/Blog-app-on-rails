require 'rails_helper'

RSpec.describe 'User page', type: :system do
  describe 'User show' do
    before(:each) do
      @user1 = User.create!(name: 'captain', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Engineer from china.', posts_counter: 0)
      @user2 = User.create!(name: 'kevin', photo: 'https://unsplash.com/photos/zedf', bio: 'system admin.',
                            posts_counter: 0)
      @post1 = Post.create!(author: @user1, title: 'Hello', text: 'This is a post', comments_counter: 0,
                            likes_counters: 0)
      @post2 = Post.create!(author: @user2, title: 'Hello', text: 'This is a post', comments_counter: 0,
                            likes_counters: 0)
      @post3 = Post.create!(author: @user1, title: 'Hello', text: 'This is another post', comments_counter: 0,
                            likes_counters: 0)
      @post4 = Post.create!(author: @user2, title: 'Hello', text: 'This is another post', comments_counter: 0,
                            likes_counters: 0)
      @post5 = Post.create!(author: @user1, title: 'Hello', text: 'This is another post', comments_counter: 0,
                            likes_counters: 0)
      @post6 = Post.create!(author: @user2, title: 'Hello', text: 'This is another another post', comments_counter: 0,
                            likes_counters: 0)
      @post7 = Post.create!(author: @user1, title: 'Hello', text: 'This is another another another post',
                            comments_counter: 0, likes_counters: 0)
      @post8 = Post.create!(author: @user2, title: 'Hi', text: 'This is another another another post',
                            comments_counter: 0, likes_counters: 0)
    end

    it 'shows user first user' do
      visit user_path(@user1)
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user1.bio)
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_link('See all posts')

      @user1.latest_posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'user clicks on See all posts button and goes to user posts page first user' do
      visit user_path(@user1)
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
      expect(page).to have_content(@user1.name)
      @user1.posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'shows user second user' do
      visit user_path(@user2)
      expect(page).to have_selector("img[src='https://unsplash.com/photos/zedf']")
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user2.bio)
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_link('See all posts')

      @user2.latest_posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'user clicks on See all posts button and goes to user posts page second user' do
      visit user_path(@user2)
      click_link 'See all posts'
      expect(page).to have_content(@user2.name)
      expect(page).to have_current_path user_posts_path(@user2)
      @user2.posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end
  end
end
