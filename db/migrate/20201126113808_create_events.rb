class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :event_day
      t.time :start_time
      t.time :finish_time
      t.integer :prefecture, null: false, default: 0
      t.string :place
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.integer :estimate_people
      t.integer :level, null: false, default: 0
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
