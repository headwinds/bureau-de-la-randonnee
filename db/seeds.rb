# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create([
  { name: 'Solar-Powered Desk Lamp', price: 49.99, promotion_applied: false, stock_level: 100 },
  { name: 'Eco-Friendly Notebook', price: 12.99, promotion_applied: true, stock_level: 200 },
  { name: 'Recycled Plastic Pen Holder', price: 8.99, promotion_applied: false, stock_level: 150 },
  { name: 'Bamboo Desk Organizer', price: 29.99, promotion_applied: true, stock_level: 75 },
  { name: 'Energy-Efficient USB Charger', price: 19.99, promotion_applied: false, stock_level: 50 }
])