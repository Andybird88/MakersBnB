feature 'book a space' do
  scenario 'a user can book a space for at least 1 night' do
    # visit '/'
    # click_button 'Book Spaces'
    # click_button 'Book'
    visit('/book')
    expect(page).to have_content('Name:')
    expect(page).to have_button('Submit Request')
  end
end
