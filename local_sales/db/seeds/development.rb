require 'faker'

Category.create!(name: 'Food')
Category.create!(name: 'Drinks')
Category.create!(name: 'Shoe')
Category.create!(name: 'Clothe')
Category.create!(name: 'Tools')

5.times { State.create!(name: Faker::Address.state) }
5.times { Township.create!(name: Faker::Address.city, state_id: '1') }
5.times { Town.create!(name: Faker::Address.city, township_id: '1') }
5.times do
  Company.create!(name: Faker::Company.name, address: Faker::Address.full_address, phone: Faker::PhoneNumber.cell_phone, 
                  category_id: '1', town_id: '1')
end

10.times do  
  Product.create!(name: Faker::Commerce.product_name, price: Faker::Commerce.price, quantity: Faker::Number.between(from: 1, to: 20), 
                  description: Faker::Food.description, company_id: '1')
end

User.create!(email: 'admin@gmail.com', password: '12345678', name: 'Javier', role: 'super_admin')
User.create!(email: 'local@gmail.com', password: '12345678', name: 'Rodrigo', role: 'admin')
User.create!(email: 'sales@gmail.com', password: '12345678', name: 'Adrian', role: 'admin')
