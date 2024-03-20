class AddArtistIdToFakeArtworks < ActiveRecord::Migration[7.1]
  def change
    add_reference :fake_artworks, :artist, null: false, foreign_key: true
  end
end
