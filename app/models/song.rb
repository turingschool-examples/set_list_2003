class Song < ApplicationRecord
  validates_presence_of :title
  belongs_to :artist

  def self.total_songs
    count
  end
end
