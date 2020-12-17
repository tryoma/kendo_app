class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :first_agree
      t.boolean :second_agree

      t.timestamps
    end
    add_index :members, [:user_id, :event_id], unique: true
  end
end
