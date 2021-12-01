class AddBotBoolToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bot, :boolean, default: false
  end
end
