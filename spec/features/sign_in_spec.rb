feature 'sign in to account' do
    scenario 'user selects to sign in to account' do
      visit('/')
      click_button 'Sign In'
      expect(page).to have_field('username')
      expect(page).to have_field('password')
      expect(page).to have_button('Submit')
    end
  end