require 'rails_helper'

RSpec.describe Cart do

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      cart = Cart.new({
        '1' => 2,  # two copies of song 1
        '2' => 3   # three copies of song 2
      })
      expect(cart.total_count).to eq(5)
    end
  end

  describe "#add_song" do
    it "adds a song" do
      cart = Cart.new({
        '1' => 2,  # two copies of song 1
        '2' => 3   # three copies of song 2
      })

      cart.add_song(1)
      cart.add_song(2)

      expect(cart.contents).to eq({'1' => 3, '2' => 4})
    end

    it 'adds a song that hasnt been added yet' do
      cart = Cart.new({
        '1' => 2,  # two copies of song 1
        '2' => 3   # three copies of song 2
      })

      cart.add_song(3)

      expect(cart.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
    end
  end

  describe "#count_of" do
    it "returns the count of all songs in the cart" do
      cart = Cart.new({})

      expect(cart.count_of(5)).to eq(0)
    end
  end



end
