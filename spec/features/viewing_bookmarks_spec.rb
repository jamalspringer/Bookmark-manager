require_relative '../../config/environment'



feature 'Bookmark Manager' do
  scenario 'Viewing Bookmarks' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Manager!'
  end

  scenario 'Check the bookmark view' do
    visit('/bookmarks')
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
