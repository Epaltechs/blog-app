require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = Like.new
  user = User.new(name: 'Firdavs', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Weirdo')
  post = Post.new(title: 'New post came', text: 'Hey buddy are you good!', comments_counter: 0)

  before { subject.save }
  before { post.save }
  before { user.save }

  it 'user should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'user should be correct person' do
    subject.user_id = user.id
    expect(subject).to be_truthy
  end
end
