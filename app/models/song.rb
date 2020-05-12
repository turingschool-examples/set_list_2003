class Song < ApplicationRecord
  validates_presence_of :title
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def self.total_songs
    count
  end
end
