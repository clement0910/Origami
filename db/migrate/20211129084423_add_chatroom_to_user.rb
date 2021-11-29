class AddChatroomToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :chatroom
  end
end
