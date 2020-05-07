require 'rails_helper'

RSpec.describe "Destroy an Artist" do
  describe "When I visit an artists show page" do
    it "I can delete an artist" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      billy = Artist.create(name: "Billy Joel")

      visit '/artists'
      expect(page).to have_content(carly.name)

      visit "/artists/#{carly.id}"

      click_button "Delete"

      expect(current_path).to eq("/artists")
      expect(page).to_not have_content("Carly Rae")
      expect(page).to have_content(journey.name)
      expect(page).to have_content(billy.name)
    end
  end
end
