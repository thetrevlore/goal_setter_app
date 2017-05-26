class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :viewer_id, null: false
      t.integer :goal_id, null: false

      t.timestamps
    end
    add_index :views, :viewer_id
    add_index :views, :goal_id
  end
end
