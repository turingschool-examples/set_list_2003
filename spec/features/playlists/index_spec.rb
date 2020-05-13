require 'rails_helper'

RSpec.describe "the Playlist index page" do
  it "should display all playlists" do
    rock = Playlist.create!(name: "Classic Rock")
    country = Playlist.create!(name: "Country")
    jams = Playlist.create!(name: "Favorite Jams")

    talking_heads = Artist.create!(name: "Talking Heads")
    journey = Artist.create!(name: "Journey")
    zac_brown = Artist.create!(name: "Zac Brown Band")

    place = talking_heads.songs.create!(title: "This Must Be The Place", length: 832, play_count: 83209)
    heaven = talking_heads.songs.create!(title: "Heaven", length: 832, play_count: 83209)
    dont_stop = journey.songs.create!(title: "Don't Stop Believin'", length: 832, play_count: 83209)
    chicken = zac_brown.songs.create!(title: "Chicken Fried", length: 4378, play_count: 7453689)

    PlaylistSong.create!(song: chicken, playlist: country)
    PlaylistSong.create!(song: chicken, playlist: jams)
    PlaylistSong.create!(song: place, playlist: jams)
    PlaylistSong.create!(song: place, playlist: rock)
    PlaylistSong.create!(song: heaven, playlist: rock)
    PlaylistSong.create!(song: dont_stop, playlist: rock)

    visit '/playlists'

    within(".playlist-#{rock.id}") do
      expect(page).to have_content(rock.name)
      expect(page).to have_content(place.title)
      expect(page).to have_content(heaven.title)
      expect(page).to have_content(dont_stop.title)
      expect(page).to_not have_content(chicken.title)
    end

    within(".playlist-#{country.id}") do
      expect(page).to have_content(country.name)
      expect(page).to have_content(chicken.title)
      expect(page).to_not have_content(heaven.title)
    end

    within(".playlist-#{jams.id}") do
      expect(page).to have_content(jams.name)
      expect(page).to have_content(chicken.title)
      expect(page).to have_content(place.title)
      expect(page).to_not have_content(dont_stop.title)
    end
  end
end
