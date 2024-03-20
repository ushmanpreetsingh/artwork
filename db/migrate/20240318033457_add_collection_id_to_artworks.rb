class AddCollectionIdToArtworks < ActiveRecord::Migration[7.1]
  def change
    add_reference :artworks, :collection, null: false, foreign_key: true
  end
end
