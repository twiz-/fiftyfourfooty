class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :heros, [ :user_id, :created_at]
  end
end
