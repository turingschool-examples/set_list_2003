require 'rails_helper'

RSpec.describe 'Editing an Artist' do
  it "I can edit an existing artist through a form" do
    carly = Artist.create(name: "Carly Rae")

    visit "/artists/#{carly.id}"

    click_link "Edit"

    expect(current_path).to eq("/artists/#{carly.id}/edit")

    fill_in :name, with: "Carly Rae Jepsen"

    click_button "Update Artist"

    expect(current_path).to eq("/artists/#{carly.id}")
    expect(page).to have_content("Carly Rae Jepsen")
  end
end
