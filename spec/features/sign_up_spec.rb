require 'rails_helper'


RSpec.describe 'Sign up to the service', type: :feature do
    scenario 'create user with valid name input' do
      visit signup_path
      fill_in 'Name', with: 'Jason'
      click_on 'Submit'
      visit user_path(1)
      expect(page).to have_content('Log out')
    end

    scenario 'not create user with invalid name input' do
        visit signup_path
        fill_in 'Name', with: ''
        click_on 'Submit'
        visit signup_path
        expect(page).to have_content('Sign up')
    end

end



