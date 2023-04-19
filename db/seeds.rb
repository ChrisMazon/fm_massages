# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.find_by(email: "cmazon32@gmail.com")
if admin.nil?
  puts "admin user not found. creating admin user."
  User.create(email: "cmazon32@gmail.com", password: "password")
end
