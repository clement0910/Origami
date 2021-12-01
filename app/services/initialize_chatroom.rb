class InitializeChatroom
  def initialize(groups)
    @groups = groups
  end

  def call
    put_users_in_chatroom(@groups)
    @common_answers = CommonInterest.new(@groups[:group]).call
    initialize_chat
    initialize_question
  end

  private

  def put_users_in_chatroom(groups)
    chatroom = Chatroom.create!(name: "Groupe d'amis", rating: groups[:rating])
    @chatroom_id = chatroom.id
    groups[:group].each do |user|
      user.update(chatroom_id: chatroom.id)
      user.update(in_group: true)
    end
    create_chat_bot(groups)
  end

  def create_chat_bot(groups)
    file = File.open('app/assets/images/icons/apple-icon-180x180.png')
    user = User.new(first_name: "Bot", last_name: "Origami", email: "realbot@bot.fr", password: "bot000", gender: "Homme", city: "Lyon", birthday: DateTime.new(2000,2,3,4,5,6), bot: true)
    user.photo.attach(io: file, filename: 'Jeanro.png', content_type: 'image/png')
    user.chatroom_id = @chatroom_id
    user.save
    groups[:group] << user
  end

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
    array = []

    user_group = @groups[:group].reject { |group| group[:bot] == true }
    user_group.each { |user| array << user.first_name }
    "Hello, #{array.first(array.size - 1).join(', ')} et #{array[-1]}."
  end

  def create_message(content_msg)
    message = Message.new(content: content_msg)
    message.chatroom_id = @chatroom_id
    message.user_id = find_bot.id
    message.save
  end

  def find_bot
    bot_user = @groups[:group].select { |user| user[:bot] == true }
    bot_user[0]
  end

  def random_botable_question
    theme_id = Theme.find_by_name("Questions Bot").id
    #forget sample for presenration
    @common_answers.filter { |a| a[:question].theme_id == theme_id }.sample
  end
end