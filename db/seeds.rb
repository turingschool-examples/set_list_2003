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


like_you = carly.songs.create(title: "I really like you", play_count: 1050, length: 299)
run_away = carly.songs.create(title: "Run Away With Me", play_count: 2400, length: 300)
dont_stop = journey.songs.create(title: "Don't Stop Believing", play_count: 5000, length: 600)
wheel = journey.songs.create(title: "Wheel in the Sky", play_count: 80, length: 499)
piano_man = billy.songs.create(title: "Piano Man", play_count: 1000, length: 280)
vienna = billy.songs.create(title: "Vienna", play_count: 400, length: 560)
always = billy.songs.create(title: "She's Always A Woman", play_count: 2050, length: 450)


classics = Playlist.create(name: "Classics")
mikes = Playlist.create(name: "Party @ Mike's")
random = Playlist.create(name: "Random")

PlaylistSong.create(song_id:like_you.id , playlist_id:mikes.id )
PlaylistSong.create(song_id:run_away.id , playlist_id:mikes.id )
PlaylistSong.create(song_id:dont_stop.id , playlist_id:classics.id )
PlaylistSong.create(song_id:piano_man.id , playlist_id:classics.id )
PlaylistSong.create(song_id:piano_man.id , playlist_id:random.id )
PlaylistSong.create(song_id:vienna.id , playlist_id:random.id )
PlaylistSong.create(song_id:like_you.id , playlist_id:random.id )
