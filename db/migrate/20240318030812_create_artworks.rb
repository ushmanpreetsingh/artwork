class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.string :medium
      t.text :description

      t.timestamps
    end
  end
end
