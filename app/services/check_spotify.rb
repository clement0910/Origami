class CheckSpotify
  def initialize(groups)
    @groups = groups.reject { |group| group[:bot] == true }
    @bot = groups.find { |group| group[:bot] == true }
    @chatroom_id = @bot.chatroom_id
  end

  def call
    users = check_all_connect
    if users.empty
      create_message("Je vois que tout le monde a connecter son spotify!")
      create_message("Vous pouvez voir vos tags en commun dans le menu en haut à droite!")
    elsif users.size == 5
      create_message("Personne n'a connecter son spotify...")
      create_message("Cliquez sur votre profil dans la rubrique Spotify")
    else
      create_message(users_spotify_create_message(array))
    end
  end

  private

  def check_all_connect
    array = []
    @groups.each { |user| array << user unless user.connect_spotify? }
    array
  end

  def users_spotify_create_message(array)
    if array.size == 1
      "J'ai l'impression que #{array[0]} n'as pas connecter son spotify..."
    elsif size > 1
      "J'ai l'impression que #{array[0...-1].join(', ')} et #{array[-1]} n'ont pas connecter leurs spotify..."
    end
  end

  def create_message(content_msg)
    message = Message.new(content: content_msg)
    message.chatroom_id = @chatroom_id
    message.user_id = @bot.id
    message.save
  end
end