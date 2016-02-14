class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :starting_point_id
      t.string :name
      t.boolean :night_track
      t.string :map_link
      t.decimal :km, precision: 5, scale: 1
      t.text :comments

      t.timestamps
    end
    add_index :tracks, :starting_point_id
  end
end
