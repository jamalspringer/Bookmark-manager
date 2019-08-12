require_relative '../../config/environment'

feature 'Bookmark Manager' do
  scenario 'Viewing Bookmarks' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Manager!'
  end

  scenario 'Check the bookmark view' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
