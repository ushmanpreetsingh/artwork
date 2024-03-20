class AddCollectionIdToFakeArtworks < ActiveRecord::Migration[7.1]
  def change
    add_reference :fake_artworks, :collection, null: false, foreign_key: true
  end
end
