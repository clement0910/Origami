class BorisBot
  def initialize(users, message = nil)
    @message = message
    @users = users
    if message.nil?
      @initialize = false
    else
      @initialize = true
    end

  end

  def call
    initialize_chat unless @initialize
  end

  # def re_message
  #   hash = [{ id: 12, message: "J'ai vu que vous aimiez tous les chiens, alors plutot labrador ou chihuaha?" },
  #           {id: 1, message: "C'est cool, sorti en boite! plutot dupstep ou electro?"},
  #           {id: 2, message: "beaucoup d'introverti dans la salle ce soir.. je suis la pour vous accompagner"}]
  #
  #   random = hash.sample
  #   if check_all_likes(random[:id])
  #     message = Message.new(content: random[:string])
  #     message.chatroom = @users.first.chatroom
  #     message.user(User.find(2)) #need to make bot
  #     message.save
  #     if @message.save
  #       ChatroomChannel.broadcast_to(
  #         @chatroom,
  #         render_to_string(partial: "message", locals: { message: @message })
  #       )
  #     end
  #   end
  #   end

  # def check_all_likes(id)
  #   check = 0
  #   @users.each do |user|
  #     if user.find(id).response == true
  #       check += 1
  #     end
  #   end
  #   if check == 5
  #     return true
  #   else
  #     return false
  #   end
  # end

end