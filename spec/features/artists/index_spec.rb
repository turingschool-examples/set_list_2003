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
  end
end

# As a visitor
# When I visit ‘/artists’
# I see a list of all artist names
