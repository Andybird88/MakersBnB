feature 'has a view spaces page' do
  scenario 'welcomes user' do
    visit('/view_spaces')
    expect(page).to have_content('MakersBnB Spaces:')
  end
end