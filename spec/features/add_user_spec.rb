feature 'adding user' do
  scenario 'a new user can create an account' do
    visit('/')
    click_button 'Create Account'
    fill_in('Name', with: 'John Makers')
    fill_in('Username', with: 'John_makers')
    fill_in('Email', with: 'john@makers.tech')
    fill_in('Password', with: 'test')
    click_button('Submit')

    expect(page).to have_content('Hi John!')
  end
end