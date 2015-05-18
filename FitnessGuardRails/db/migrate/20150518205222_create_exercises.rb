class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :erklaerung
      t.string :video_link

      t.timestamps
    end
  end
end
