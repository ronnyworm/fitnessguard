class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :date
      t.string :duration

      t.timestamps
    end
  end
end
