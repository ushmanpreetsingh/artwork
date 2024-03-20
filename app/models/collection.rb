class Collection < ApplicationRecord
    has_many :artworks
    validates :name, presence: true
  end