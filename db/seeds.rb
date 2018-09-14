User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

69.times do |n|
  name  = Faker::Name.unique.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password, activated: true,
    activated_at: Faker::Time.backward(14, :evening))
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Book.title
  description = Faker::Lorem.sentence(5)
  users.each do |user|
    user.books.create!(name: name, description: description)
  end
end

books = Book.all
10.times do |n|
  name  = Faker::Book.author
  Author.create! name: name
end
books.each do |book|
  book.author_ids = rand(1..10)
end

5.times do |n|
  name  = Faker::Book.genre
  Category.create! name: name
end
books.each do |book|
  book.category_ids = rand(1..5)
end
