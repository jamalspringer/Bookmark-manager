require_relative '../../config/environment'

feature 'Bookmark Manager' do
  scenario 'Viewing Bookmarks' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Manager!'
  end
end
