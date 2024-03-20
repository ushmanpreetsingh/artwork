class Artwork < ApplicationRecord
    belongs_to :artist
    belongs_to :collection

    validates :title, presence: true, uniqueness: true
    validates :year, presence: true
  end
  