feature 'book a space' do
  scenario 'a user can book a space for at least 1 night' do
    visit '/book'
    # visit '/'
    # click_button 'Book Spaces'
    # click_button 'Book'
    expect(page).to have_content('Name:')
    expect(page).to have_button('Submit Request')
  end
end
