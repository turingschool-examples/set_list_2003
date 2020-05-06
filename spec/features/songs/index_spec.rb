require 'rails_helper'

RSpec.describe "as a user, when i visit the index page", type: :feature do
  # before :each do
  #   @carly = Artist.create(name: "Carly Rae")
  #   @song_1 = @carly.songs.create(title:       "I Really Like You",
  #                        length:      208,
  #                        play_count:  243810867)
  #   @song_2 = Song.create(title:       "Call Me Maybe",
  #                        length:      199,
  #                        play_count:  1214722172,
  #                        artist_id: @carly.id)
  #   visit "/songs"
  # end
  it "can see all songs titles and play count" do
    carly = Artist.create(name: "Carly Rae")
    song_1 = carly.songs.create(title:       "I Really Like You",
                         length:      208,
                         play_count:  243810867)
    song_2 = Song.create(title:       "Call Me Maybe",
                         length:      199,
                         play_count:  1214722172,
                         artist_id: carly.id)
    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it "can see the count of all the songs" do
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
    visit "/songs"

    expect(page).to have_content("Total Number of Songs: 3")
  end
end
