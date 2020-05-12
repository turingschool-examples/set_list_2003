require 'rails_helper'

RSpec.describe Song do
  describe "validations" do
    it {should validate_presence_of :title}
  end
  describe "relationships" do
    it {should belong_to :artist}
    it {should have_many :playlist_songs}
    it {should have_many(:playlists).through(:playlist_songs)}
  end
  describe "methods" do
    it ".total_songs" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      song_1 = carly.songs.create(title:       "I Really Like You",
                           length:      208,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  1214722172,
                           artist_id: carly.id)
      song_3 = Song.create(title:       "Don't Stop Believin",
                           length:      199,
                           play_count:  1214722172,
                           artist_id: journey.id)

      songs = Song.all
      carlys_songs = carly.songs

      expect(songs.total_songs).to eq(3)
      expect(carlys_songs.total_songs).to eq(2)
    end
  end
end

# class methods are used when we're calling them on a collection


# things to test in model tests:
# - validations -
# - relationships -
# - class/instance methods
