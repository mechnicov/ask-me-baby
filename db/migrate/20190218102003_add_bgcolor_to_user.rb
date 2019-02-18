class AddBgcolorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bgcolor, :string
  end
end
