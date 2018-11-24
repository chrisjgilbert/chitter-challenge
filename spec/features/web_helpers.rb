def sign_in_and_sign_up
  visit '/'
  click_button 'Sign Up'
  expect(current_path).to eq '/users/new'
  fill_in('name', with: 'Test Name')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('username', with: 'my_username')
  click_button('Submit')
end
