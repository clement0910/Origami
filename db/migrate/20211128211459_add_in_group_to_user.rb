class AddInGroupToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :in_group, :boolean, default: false
  end
end
