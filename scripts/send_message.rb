clement = User.find_by_email('clement@gmail.com')
gael = User.find_by_email('gael@gmail.com')
laura = User.find_by_email('laura@gmail.com')
cassandra = User.find_by_email('cassandra@gmail.com')

MESSAGE = [{user: gael, message: 'Salut tout le monde !'},
           {user: cassandra, message: 'Coucouuu'},
           {user: gael, message: 'Vu que tout le monde aime les concerts, y’en a un de Josman le 18 décembre mais j’ai personne pour venir avec moi, ça pourrait être sympa'},
           {user: clement, message: 'Grave j’avais pas pu y aller l’an dernier à cause de ce foutu covid'},
           {user: laura, message: 'Moi j’suis un peu timide, ça vous dirais pas d’aller boire une bière pour apprendre à se connaitre avant ?'},
           {user: cassandra, message: 'Oui, bonne idée, je connais le barman du Barjaqueur, si ça vous intéresse'},
           {user: gael, message: 'J’ai justement un collègue qui m’en a parlé la semaine dernière donc oui carrément. Ça vous irait demain soir ?'},
           {user: clement, message: 'On se dit 20h au Barjaqueur si ça va à tout le monde'},
           {user: laura, message: 'Niquel, à demain alors ! 😇'}]


def create_message(content_msg, user)
  message = Message.new(content: content_msg)
  message.chatroom_id = user.chatroom_id
  message.user_id = user.id
  chatroom_lol = Chatroom.last
  message.save
  ChatroomChannel.broadcast_to(
    chatroom_lol,
    ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message })
  )
end

index = 0
loop do
  char = gets
  ap char
  break if char != "\n"


  create_message(MESSAGE[index][:message], MESSAGE[index][:user])
  index += 1
end