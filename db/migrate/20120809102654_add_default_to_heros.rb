class AddDefaultToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :default, :boolean
  end
end
