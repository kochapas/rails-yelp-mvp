# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '🔫 Destroy all the data...'
Restaurant.destroy_all
Review.destroy_all
puts '🌲 Seeding...'
12.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.street_address
  restaurant.phone_number = Faker::PhoneNumber.cell_phone
  restaurant.category = %w[chinese italian japanese french belgian].sample
  restaurant.save
  rand(3..5).times do
    review = Review.new
    review.restaurant = restaurant
    review.rating = rand(1..5)
    review.content = Faker::Restaurant.review
    review.save
  end
end
puts "🧶 Complete! #{Restaurant.count} rows added..."
