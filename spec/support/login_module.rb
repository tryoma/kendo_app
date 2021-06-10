module LoginModule
  def login(user)
    visit '/users/sign_in'
    fill_in 'メールアドレス', with: "#{user.email}"
    fill_in 'パスワード', with: 'password'
    find('.btn').click
  end
end
