User.create!(user_name: "Sample User",
  email: "sample@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)

User.create!(user_name: "Sample User1",
  email: "sample1@email.com",
  password: "password",
  password_confirmation: "password",
  admin: false)