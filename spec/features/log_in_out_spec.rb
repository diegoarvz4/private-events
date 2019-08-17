require 'rails_helper'

RSpec.describe 'Login a user', type: :feature do
    scenario 'login a user with valid name input' do
      user = User.create!(name: 'Jon')
      visit login_path
      fill_in 'Name', with: 'Jon'
      click_on 'Submit'
      visit user_path(user)
      expect(page).to have_content('Log out')
    end

    scenario 'not login a user with invalid name input' do
        user = User.create!(name: 'Jon')
        visit login_path
        fill_in 'Name', with: 'Joe'
        click_on 'Submit'
        visit login_path(user)
        expect(page).to have_content('Log in')
      end
end
