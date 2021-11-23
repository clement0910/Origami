class AddCityToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city, :string
  end
end
