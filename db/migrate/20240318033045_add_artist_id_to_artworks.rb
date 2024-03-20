class AddArtistIdToArtworks < ActiveRecord::Migration[7.1]
  def change
    add_reference :artworks, :artist, null: false, foreign_key: true
  end
end
