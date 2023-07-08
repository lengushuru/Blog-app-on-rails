require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create!(name: 'Lengushuru Charles', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                 bio: 'Full-stack web developer.',
                 posts_counter: 0)
  end
  describe 'GET /index' do
    before(:each) do
      get '/users'
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
      expect(response.body).to include('All Users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get "/users/#{user.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
end
