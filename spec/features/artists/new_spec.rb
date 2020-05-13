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

  it 'I can not create an artist without a name' do
    visit '/artists/new'

    click_on 'Create Artist'

    expect(page).to have_content("Artist not created: Required information missing.")
    expect(page).to have_button('Create Artist')
  end
end











# I am redirected to this new artists show page
