class CreateActivitynames < ActiveRecord::Migration
  def change
    create_table :activitynames do |t|
      t.string :name

      t.timestamps
    end
  end
end
