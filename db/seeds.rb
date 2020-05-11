# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.destroy_all
Artist.destroy_all

carly = Artist.create(name: "Carly Rae")
journey = Artist.create(name: "Journey")
billy = Artist.create(name: "Billy Joel")


carly.songs.create(title: "I really like you", play_count: 1050, length: 299)
carly.songs.create(title: "Run Away With Me", play_count: 2400, length: 300)
journey.songs.create(title: "Don't Stop Believing", play_count: 5000, length: 600)
journey.songs.create(title: "Wheel in the Sky", play_count: 80, length: 499)
billy.songs.create(title: "Piano Man", play_count: 1000, length: 280)
billy.songs.create(title: "Vienna", play_count: 400, length: 560)
billy.songs.create(title: "She's Always A Woman", play_count: 2050, length: 450)
