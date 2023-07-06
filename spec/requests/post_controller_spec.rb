require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create!(name: 'lengushuru Charles', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Electrical engineer.', posts_counter: 0) }
  let(:post) do
    Post.create!(user: user, title: 'My first post', text: 'This is my first post.', comments_counter: 0,
                 likes_counters: 0)
  end
  describe 'GET /index' do
    before(:each) do
      get "/users/#{user.id}/posts"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'include the list of users' do
      expect(response.body).to include('All Posts')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'include the details of a post' do
      expect(response.body).to include('Post')
    end
  end
end