# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.count == 0

if User.count <= 20
  99.times do |n|
      first_name  = Faker::Name.name
      last_name  = Faker::FunnyName.two_word_name
      age = "2#{n}"
      email = "#{n + 1}test@mail.com"
      password = 'password'
      phone = "+232132#{ n + 1}"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   age: age,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
  end
end
