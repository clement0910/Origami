

chatroom = Chatroom.last
if chatroom
  chatroom.users.update_all(chatroom_id: nil, in_group: false)
  chatroom.messages.destroy_all
  chatroom.destroy
end

CreateGroup.new.call