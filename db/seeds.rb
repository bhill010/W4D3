require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
u1 = User.create!(user_name: "Brandon", password: "hunter12")
u2 = User.create!(user_name: "Chase", password: "password123")

Cat.destroy_all
c1 = Cat.create!(birth_date: "01/01/1990", color: "black", name: "Tom", sex: "M", description: "cat", user_id: 1)
c1 = Cat.create!(birth_date: "03/01/2000", color: "brown", name: "Brady", sex: "F", description: "cat", user_id: 2)
c1 = Cat.create!(birth_date: "03/01/2015", color: "white", name: "Polu", sex: "F", description: "cat", user_id: 2)

CatRentalRequest.destroy_all
r1 = CatRentalRequest.create!(cat_id: 1, end_date: Date.today, start_date: 2.days.ago)
r2 = CatRentalRequest.create!(cat_id: 2, end_date: 3.days.ago, start_date: 1.month.ago)
r3 = CatRentalRequest.create!(cat_id: 2, end_date: 3.days.ago, start_date: 1.month.ago)
