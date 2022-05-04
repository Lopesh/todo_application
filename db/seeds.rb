# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times {|t| Task.create(title: "task_#{t}", description: "This is task #{t}", status: rand(1..4), user_id: User.last.id, deadline: (Time.now + 1.day + 1.hour + rand(1..15).minute)) }