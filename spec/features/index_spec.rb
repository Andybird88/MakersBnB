feature 'has an index page' do
  scenario 'welcomes user' do
    visit('/')
    expect(page).to have_content('Welcome to MakersBnB')
  end

  scenario 'has view spaces button' do
    visit('/')
    expect(page).to have_button('View Spaces')
  end

  scenario 'has create spaces button' do
    visit('/')
    expect(page).to have_button('Create Spaces')
  end

  scenario 'has book spaces button' do
    visit('/')
    expect(page).to have_button('Book Spaces')
  end
end