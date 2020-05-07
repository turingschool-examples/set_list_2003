require 'rails_helper'

RSpec.describe 'Create an Artist' do
  it "I can create a new artist through a form" do
    visit '/artists'

    click_link "New Artist"

    expect(current_path).to eq('/artists/new')

    fill_in :name, with: "Carly Rae"

    click_on "Create Artist"

    new_artist = Artist.last

    expect(new_artist.name).to eq("Carly Rae")
    expect(current_path).to eq("/artists/#{new_artist.id}")
    # expect(page).to have_content("Carly Rae")

  end
end











# I am redirected to this new artists show page
