class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :title
      t.string :body
      t.date :until
      t.string :attachment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
