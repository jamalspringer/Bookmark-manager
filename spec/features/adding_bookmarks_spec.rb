require_relative '../../config/environment'

feature 'Adding bookmarks' do
  scenario 'User can add a bookmark' do
  visit('/bookmarks')
  click_link('Add Bookmark')
  fill_in('url', with: 'www.github.com')
  click_button("Submit")
  expect(page).to have_content 'www.github.com'
  end
end


