feature 'user registration' do
  scenario 'a user can sign up to chitter' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in('name', with: 'Test Name')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'my_username')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Chitter!\nWelcome my_username, take a look the chitter timeline!"
  end
end
