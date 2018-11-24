feature 'authentication' do
  it 'a user can sign in' do
    User.create(
      name: 'Chris Gilbert',
      username: 'PeeperChris',
      email: 'test@example.com',
      password: 'password123')

    visit '/'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content "Chitter!\nWelcome PeeperChris"
  end

  it 'a user cant sign in with invalid email' do
    User.create(
      name: 'Chris Gilbert',
      username: 'PeeperChris',
      email: 'test@example.com',
      password: 'password123')

    visit '/'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'blah@bleh.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content 'Please check your email or password.'
    expect(page).not_to have_content "Chitter!\nWelcome PeeperChris"
  end

  it 'a user cant sign in with invalid password' do
    User.create(
      name: 'Chris Gilbert',
      username: 'PeeperChris',
      email: 'test@example.com',
      password: 'password123')

    visit '/'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'notrightpassword')
    click_button('Sign In')

    expect(page).to have_content 'Please check your email or password.'
    expect(page).not_to have_content "Chitter!\nWelcome PeeperChris"
  end

  it 'a user can sign out' do
    User.create(
      name: 'Chris Gilbert',
      username: 'PeeperChris',
      email: 'test@example.com',
      password: 'password123')

    visit '/'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content "Chitter!\nWelcome PeeperChris"

    click_button('Sign Out')

    expect(page).not_to have_content "Chitter!\nWelcome PeeperChris"
    expect(page).to have_content "You have signed out. Come back soon!"
  end
end
