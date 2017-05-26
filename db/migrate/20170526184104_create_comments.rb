class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :goal_id, null: false
      t.integer :authour_id, null: false

      t.timestamps
    end
    add_index :comments, :goal_id
    add_index :comments, :authour_id
  end
end
