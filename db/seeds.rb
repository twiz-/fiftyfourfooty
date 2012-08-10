# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hero.create({ name: 'Theo Walcott' })
Hero.create({ name: 'Steven Gerrard', default: true })
Hero.create({ name: 'John Terry' })

User.create({
  name: 'tony',
  email: 'tony@54footy.com',
  password: 'poop009',
  password_confirmation: 'poop009'
})

User.create({
  name: 'jp',
  email: 'jpsilvashy@gmail.com',
  password: 'poop009',
  password_confirmation: 'poop009'
})

