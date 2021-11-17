feature 'creates a new account' do
  scenario 'user selects to create a new account' do
    visit('/')
    click_button 'Create Account'
    expect(page).to have_field('name')
    expect(page).to have_field('username')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Submit')
  end
end