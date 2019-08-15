require_relative '../../config/environment'

feature 'Adding bookmarks' do
  scenario 'User can add a bookmark' do
  visit('/bookmarks')
  click_link('Add Bookmark')
  fill_in('url', with: 'https://www.github.com')
  fill_in('title', with: 'Github repo site')
  click_button("Submit")
  expect(page).to have_link('Github repo site', href: 'https://www.github.com')
  end
end


