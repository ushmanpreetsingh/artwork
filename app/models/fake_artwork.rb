class FakeArtwork < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
end