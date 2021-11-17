feature 'has an index page' do
  scenario 'welcomes user' do
    visit('/')
    expect(page).to have_content('Welcome to MakersBnB')
  end

  scenario 'has Create Account button' do
    visit('/')
    expect(page).to have_button('Create Account')
  end

  scenario 'has Sign In button' do
    visit('/')
    expect(page).to have_button('Sign In')
  end

  scenario 'has view spaces button' do
    visit('/')
    expect(page).to have_button('View Spaces')
  end

  scenario 'has create spaces button' do
    visit('/')
    expect(page).to have_button('Create Spaces')
  end
end