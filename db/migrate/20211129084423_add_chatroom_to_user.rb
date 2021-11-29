class AddChatroomToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :chatroom, null: true, foreign_key: true
  end
end
