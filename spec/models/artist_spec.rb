require 'rails_helper'

RSpec.describe Artist do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :songs}
  end
  describe "methods" do
    it "#average_song_length" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      song_1 = carly.songs.create(title:       "I Really Like You",
                           length:      200,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      300,
                           play_count:  1214722172,
                           artist_id: carly.id)
      song_3 = Song.create(title:       "Don't Stop Believin",
                           length:      199,
                           play_count:  1214722172,
                           artist_id: journey.id)

      expect(carly.average_song_length).to eq(250)
      expect(journey.average_song_length).to eq(199)
    end
  end
end


# things to test in model tests:
# - validations -
# - relationships -
# - class/instance methods
