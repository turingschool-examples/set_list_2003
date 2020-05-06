# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



carly = Artist.create(name: "Carly Rae")
journey = Artist.create(name: "Journey")
billy = Artist.create(name: "Billy Joel")


carly.songs.create(title: "I really like you", play_count: 222, length: 4999)
journey.songs.create(title: "Don't Stop Believing", play_count: 500, length: 600)
journey.songs.create(title: "Wheel in the Sky", play_count: 700, length: 600)
billy.songs.create(title: "Piano Man", play_count: 700, length: 600)
