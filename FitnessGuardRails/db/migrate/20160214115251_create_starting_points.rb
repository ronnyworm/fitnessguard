class CreateStartingPoints < ActiveRecord::Migration
  def change
    create_table :starting_points do |t|
      t.integer :region_id
      t.string :name
      t.string :map_link

      t.timestamps
    end
  end
end
