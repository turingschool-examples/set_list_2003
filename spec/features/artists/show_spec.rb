require 'rails_helper'

RSpec.describe "Artist Show Page" do
  describe "When I visit '/artists/:id'" do
    it "I see that artists name and I do not see any of the other artists in my database" do
      carly = Artist.create(name: "Carly Rae")
      journey = Artist.create(name: "Journey")
      billy = Artist.create(name: "Billy Joel")

      visit "/artists/#{carly.id}"

      expect(page).to have_content(carly.name)
      expect(page).to_not have_content(journey.name)
      expect(page).to_not have_content(billy.name)
    end
  end
end
