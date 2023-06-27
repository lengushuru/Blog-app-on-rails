require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'i am developer',
                     posts_counter: 0)
  subject = user.posts.new(title: 'Post 1', text: 'This is post 1', comments_counter: 0, likes_counters: 0,
                           author_id: 11)

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 'w'
    expect(subject).to_not be_valid
  end

  it 'likes_counters should be an integer' do
    subject.likes_counters = 'w'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -2
    expect(subject).to_not be_valid
  end

  it 'likes_counters should be greater than or equal to 0' do
    subject.likes_counters = -2
    expect(subject).to_not be_valid
  end
end
