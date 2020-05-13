require 'rails_helper'

describe 'Artists index page' do
  describe "when I visit '/artists'" do
    it "I see a list of all artist names" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      billy = Artist.create(name: "Billy Joel")

      visit '/artists'

      expect(page).to have_content(carly.name)
      expect(page).to have_content(journey.name)
      expect(page).to have_content(billy.name)
    end
    it "I can delete an artist from the index page" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      billy = Artist.create(name: "Billy Joel")

      visit '/artists'

      expect(page).to have_css(".artist-#{billy.id}")

      within ".artist-#{carly.id}" do
        expect(page).to have_content(carly.name)
        expect(page).to have_button("Delete")
      end

      within ".artist-#{journey.id}" do
        expect(page).to have_content(journey.name)
        expect(page).to have_button("Delete")
      end

      within ".artist-#{billy.id}" do
        expect(page).to have_content(billy.name)
        click_button "Delete"
      end

      expect(current_path).to eq("/artists")
      expect(page).to_not have_css(".artist-#{billy.id}")
    end
  end
end


# And next to each artist is a link to delete that artist
# When I click on a specific artist’s delete button
# I’m returned to the artists index page
# And I no longer see that artist listed on that page
