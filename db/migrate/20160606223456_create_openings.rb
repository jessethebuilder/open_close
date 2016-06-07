class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.string :day_of_week
      t.datetime :open_time
      t.datetime :close_time
      t.integer :open_and_close_id
      t.string :open_and_close_type

      t.timestamps null: false
    end
  end
end
