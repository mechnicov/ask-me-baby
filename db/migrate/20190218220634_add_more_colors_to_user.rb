class AddMoreColorsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fontcolor, :string
    add_column :users, :bordercolor, :string
  end
end
