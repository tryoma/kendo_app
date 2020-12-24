class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :title
      t.string :body
      t.date :limited
      t.string :youtube
      t.string :youtube_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
