class Artist <ApplicationRecord
  validates_presence_of :name
  has_many :songs

  def average_song_length
    songs.average(:length)
  end
end
