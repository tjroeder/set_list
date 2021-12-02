class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length).round(2)
  end

  def total_count
    self.songs.sum(:play_count)
  end
end