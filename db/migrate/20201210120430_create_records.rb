class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :worked_on
      t.string :title
      t.text :content
      t.boolean :practice, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
