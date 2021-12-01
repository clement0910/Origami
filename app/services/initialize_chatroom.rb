class InitializeChatroom
  def initialize(groups)
    @groups = groups
    @chatroom_id = groups[0].chatroom_id
  end

  def call
    @common_answers = CommonInterest.new(@groups).call
    initialize_chat
  end

  def initialize_chat
    @question = @common_answers.sample
    message = Message.new(content: @question.content)
    message.chatroom_id = @chatroom_id
    message.user_id = User.find_by_slug('botb').id
    message.save
  end

end