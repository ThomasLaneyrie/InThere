require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with('valid@example.com', 'password')

    expect(page).to have_content('Accueil')
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Inscription !'
  end
end