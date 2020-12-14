class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :event_day
      t.datetime :start_time
      t.datetime :finish_time
      t.string :prefecture
      t.string :place
      t.string :latitude
      t.string :longitude
      t.integer :estimate_people
      t.integer :level
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end