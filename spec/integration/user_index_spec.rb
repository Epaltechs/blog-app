require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @first_user = User.create(name: 'firstuser', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @second_user = User.create(name: 'seconduser', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Poland', posts_counter: 2)
  end
  it 'shows correct username' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    expect(page).not_to have_content('Emmanuel')
  end

  it 'can see profile picture for each user' do
    visit users_path
    expect(page).to have_selector("img[src*='#{@first_user.photo}']")
  end

  it 'shows the number of posts each user has written' do
    Post.create(title: 'Hello', text: 'This is my first post', user: @first_user)
    Post.create(title: 'Hello2', text: 'This is my second post', user: @first_user)
    visit users_path
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'when user is clicked, it should be redirected to user show page' do
    third_user = User.create(name: 'Huseyin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Poland', posts_counter: 2)
    visit users_path
    click_on third_user.name
    expect(page).to have_current_path(user_path(third_user.id))
  end
end
