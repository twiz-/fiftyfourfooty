class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.references :user
      
      t.timestamps
    end
    add_index :heros, [ :user_id, :created_at]
  end
end
