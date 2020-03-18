# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.destroy_all

%i[admin customer].each do |role|
  Role.create! name: role
end

user1 = User.create(firstname: 'DevShop', lastname: 'Admin', city: 'New York', phoneno: '03001234567', email: 'admin@devshop.com', password: 'devshop1234', password_confirmation: 'devshop1234')
user1.add_role(:admin)
