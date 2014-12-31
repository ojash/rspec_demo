require 'rails_helper'

describe 'Feature test of user creation', type: :feature do
  let(:name) { Faker::Name.name }
  let(:user) { create(:user)}
  it 'creates new user' do
    visit 'users'
    click_link 'New User'
    fill_in 'Name', with: name
    fill_in 'Gender', with: 'male'
    click_button 'Create User'
    save_and_open_page
    expect(page).to have_content('User was successfully created.')
    expect(User.last.name).to eql(name)
  end
  it 'shows error message' do
    visit 'users/new'
    fill_in 'Name', with: ''
    fill_in 'Gender', with: 'other'
    click_button 'Create User'
    # save_and_open_page
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Gender is not included in the list')
  end
end
