module SignInSupport
  def sign_in(user)
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end