class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activityname_id
      t.date :date

      t.timestamps
    end
    add_index :activities, :activityname_id
  end
end
