# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(9..17).to_a.each do |hour|
  BookingTime.create(hour: hour, day: Date.current + 2.days)
  puts "time created"
end

(9..17).to_a.each do |hour|
  BookingTime.create(hour: hour, day: Date.current + 3.days)
  puts "time created"
end
