feature 'create a new space' do
    scenario 'a user can create a new space' do
        # visit '/'
        # click_button 'Create Spaces'
        visit '/createspace'
        expect(page).to have_content('Description')
        expect(page).to have_content('Name')

    end
    

end