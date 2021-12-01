class InitializeChatroom
  def initialize(groups)
    @groups = groups
    @chatroom_id = groups[0].chatroom_id
  end

  def call
    @common_answers = CommonInterest.new(@groups).call
    # initialize_tags
    initialize_chat
    initialize_question
  end

  private

  # def initialize_tags
  #   @common_answers
  # end

  def initialize_chat
    create_message("Notre algorithme vous à ajouté au groupe !")
    create_message(message_group)
  end

  def initialize_question
    @question = random_botable_question
    create_message(@question[:bool] ? @question[:question].sentence_bot.true : @question[:question].sentence_bot.false)
    #create gif
  end

  def message_group
    users = "Hello "
    user_group = @groups.reject { |group| group[:email] == 'bot@bot.fr' }
    user_group.each do |user|
      users += "#{user.first_name}, "
    end
    users_group.reverse.sub(',', 'and').reverse
  end

  def create_message(content_msg)
    message = Message.new(content: content_msg)
    message.chatroom_id = @chatroom_id
    message.user_id = User.find_by_slug('botb').id
    message.save
  end

  def random_botable_question
    theme_id = Theme.find_by_name("Questions Bot").id
    #forget sample for presenration
    @common_answers.filter { |a| a[:question].theme_id == theme_id }.sample
  end
end
