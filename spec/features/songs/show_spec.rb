require 'rails_helper'

RSpec.describe "Song Show Page" do
  describe "When I visit /songs/:id" do
    it "I see that song's title, playcount, length, and artist name" do
      carly = Artist.create(name: "Carly Rae")
      song_1 = carly.songs.create(title:       "I Really Like You",
                           length:      208,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  1214722172,
                           artist_id: carly.id)

      visit "/songs/#{song_1.id}"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_1.artist.name)
      expect(page).to have_content("Length: #{song_1.length}")
      expect(page).to have_content("Play Count: #{song_1.play_count}")
      expect(page).to_not have_content(song_2.title)
      expect(page).to_not have_content("Play Count: #{song_2.play_count}")
      expect(page).to_not have_content("Length: #{song_2.length}")
    end
  end
end


# As a visitor
# When I visit ‘/songs/:id’ (where :id is a number for a particular song in my database)
# Then I see that song's title, play_count, length, and artist name
# And I do not see any of the other songs in my database
