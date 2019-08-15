require_relative '../../config/environment'

# Currently working on this feature test, deleting works! but th tests is not yey working!
feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://Redis.com', title: 'Redis')
    visit('/bookmarks')
    expect(page).to have_link('Redis', href: 'http://Redis.com')

    # first('.bookmark').click_button 'Delete'
    find('.bookmark', match: :first).click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to_have_link('Redis', href: 'http://Redis.com')
  end
end