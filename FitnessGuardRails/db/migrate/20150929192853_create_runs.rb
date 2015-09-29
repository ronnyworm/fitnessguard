class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :date
      t.string :participants
      t.decimal :km, :precision => 5, :scale => 1
      t.integer :duration
      t.integer :max_pulse
      t.text :comments
      t.string :map_link

      t.timestamps
    end
  end
end
