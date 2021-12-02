SentenceBot.destroy_all
Tag.destroy_all
Answer.destroy_all
Question.destroy_all
Theme.destroy_all
Message.destroy_all
ArtistGenre.destroy_all
UserArtist.destroy_all
User.destroy_all
Chatroom.destroy_all

file = File.open('app/assets/images/icons/apple-icon-180x180.png')
user = User.new(first_name: "Cassandra", last_name: "Nom", email: "bot@bot.fr", password: "bot000", gender: "Femme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6))
user.photo.attach(io: file, filename: 'Jeanro.png', content_type: 'image/png')
user.save

file = File.open('app/assets/images/tom.jpg')
user = User.new(first_name: "Tom", last_name: "Rosiere", email: "tom@gmail.com", password: "admin00", gender: "Homme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6))
user.photo.attach(io: file, filename: 'tom.jpg', content_type: 'image/jpg')
user.save

file = File.open('app/assets/images/gael.jpg')
user = User.new(first_name: "Gael", last_name: "Tardy", email: "gael@gmail.com", password: "admin00", gender: "Homme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6))
user.photo.attach(io: file, filename: 'gael.jpg', content_type: 'image/jpg')
user.save

file = File.open('app/assets/images/icons/apple-icon-180x180.png')
user = User.new(first_name: "Cibylle", last_name: "Nom", email: "bot2@bot.fr", password: "bot000", gender: "Femme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6))
user.photo.attach(io: file, filename: 'Jeanro.png', content_type: 'image/png')
user.save

Theme.create!(name: "Questions Algorithme")

file = File.open('app/assets/images/template_cards/template_card_0.jpg')
Question.create!(content: "Ready ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_0.jpg', content_type: 'image/jpg')

file = File.open('app/assets/images/template_cards/template_card_3.jpg')
Question.create!(content: "Introverti ou extraverti ?", weight: 0.8, theme: Theme.last).photo.attach(io: file, filename: 'template_card_3.jpg', content_type: 'image/jpg')
Tag.create!(false: "Introverti", true: "Extraverti", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_8.jpg')
Question.create!(content: "Plutôt Mojito ou Virgin Mojito ?", weight: 0.85, theme: Theme.last).photo.attach(io: file, filename: 'template_card_8.jpg', content_type: 'image/jpg')
Tag.create!(false: "Mojito", true: "Virgin mojito", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_10.jpg')
Question.create!(content: "Plutôt Bière ou Vin ? ", weight: 0.4, theme: Theme.last).photo.attach(io: file, filename: 'template_card_10.jpg', content_type: 'image/jpg')
Tag.create!(false: "Biere", true: "Vin", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_13.jpg')
Question.create!(content: "Passes-tu beaucoup de temps sur les réseaux ?", weight:0.7, theme: Theme.last).photo.attach(io: file, filename: 'template_card_13.jpg', content_type: 'image/jpg')
Tag.create!(false: "La vrai vie", true: "Addict aux reseaux", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_15.jpg')
Question.create!(content: "Travail de groupe ou travail en solo ?", weight: 0.8, theme: Theme.last).photo.attach(io: file, filename: 'template_card_15.jpg', content_type: 'image/jpg')
Tag.create!(false: "Travail de groupe", true: "Travail en solo", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_30.jpg')
Question.create!(content: "Sport collectif ou sport individuel ?", weight: 0.7, theme: Theme.last).photo.attach(io: file, filename: 'template_card_30.jpg', content_type: 'image/jpg')
Tag.create!(false: "Sport collectif", true: "Sport individuel", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_21.jpg')
Question.create!(content: "Simple amateur de musique ou grand mélomane ?", weight: 0.4, theme: Theme.last).photo.attach(io: file, filename: 'template_card_21.jpg', content_type: 'image/jpg')
Tag.create!(false: "Amateur de musique", true: "Grand mélomane", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_25.jpg')
Question.create!(content: "Films ou séries ?", weight: 0.2, theme: Theme.last).photo.attach(io: file, filename: 'template_card_25.jpg', content_type: 'image/jpg')
Tag.create!(false: "Film", true: "Séries", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_14.jpg')
Question.create!(content: "Chien ou chat ?", weight: 0.1, theme: Theme.last).photo.attach(io: file, filename: 'template_card_14.jpg', content_type: 'image/jpg')
Tag.create!(false: "Chien", true: "Chat", question: Question.last)

Theme.create!(name: "Questions Bot")

file = File.open('app/assets/images/template_cards/template_card_24.jpg')
Question.create!(content: "Home-made ou Plats préparés ?", weight: 0.5, theme: Theme.last).photo.attach(io: file, filename: 'template_card_24.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt home-made par ici... Healthy, vegan, yes-life etc... Vous parlez en hashtag aussi j'imagine ?", true: "Plutôt plats préparés par ici... Une bonne team de Tanguy", question: Question.last)
Tag.create!(false: "Home-made", true: "Plats préparés", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_16.jpg')
Question.create!(content: "Lecteur du dimanche ou grand lecteur ?", weight: 0.8, theme: Theme.last).photo.attach(io: file, filename: 'template_card_16.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Les livres c'est pas votre truc ici hein ? Moi être la pour faire vous ami", true: "Vous aimez les livres ici hein ? Pour rappel ca fait pas de vous des intellectuels, prenez pas la grosse tête merci", question: Question.last)
Tag.create!(false: "Petit lecteur", true: "Grand lecteur", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_12.jpg')
Question.create!(content: "Sortie Musée/Expo ou Concert/Festival ?", weight: 0.8, theme: Theme.last).photo.attach(io: file, filename: 'template_card_12.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt musées/expos par ici... un groupe de pedant parisiens ca s'annonce bien...", true: "plutot concerts/festivals par ici... Des adeptes de drogues en tout genre du coup", question: Question.last)
Tag.create!(false: "Musée/Expo", true: "Concert/Festival", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_7.jpg')
Question.create!(content: "Team Beer-Pong ou Ping-Pong ?", weight: 0.1, theme: Theme.last).photo.attach(io: file, filename: 'template_card_7.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Je vois qu'on a un groupe d'alcoolique ici. Pourquoi pas un barathon après le beer-pong", true: "Je vois que tout le monde prefere le ping-pong à l'alcool... que des gens chiant enfait", question: Question.last)
Tag.create!(false: "Beer-Pong", true: "Ping-pong", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_6.jpg')
Question.create!(content: "Team Sport ou Team Canapé ?", weight: 0.6, theme: Theme.last).photo.attach(io: file, filename: 'template_card_6.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "On a une team sport ici. Si quelqu'un fait plus de 100kg, on pourra faire croire que c'est du muscle", true: "je vois qu'on a une team canapé ici... Concours de graisse ? :)", question: Question.last)
Tag.create!(false: "Team Sport", true: "Team Canapé", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_4.jpg')
Question.create!(content: "Superstitieux ou rationnel ?", weight: 0.7, theme: Theme.last).photo.attach(io: file, filename: 'template_card_4.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "On a donc des superstitieux ici. Les cailloux magique tout ca...", true: "Que des rationnels ici, on pourrait presque croire que le QI moyen du groupe depasse les 75", question: Question.last)
Tag.create!(false: "Superstitieux", true: "Rationnel", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_2.jpg')
Question.create!(content: "Dîner entre amis ou sortie en boîte ?", weight: 1, theme: Theme.last).photo.attach(io: file, filename: 'template_card_2.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "On prefere les diners plutot que sortir ici? alors comme ca on a + de 50 ans?", true: "Alors comme ca on aime se tremousser sur le dancefloor par ici ?", question: Question.last)
Tag.create!(false: "Dîner entre amis", true: "Sortie en boîte", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_31.jpg')
Question.create!(content: "Football ou Tennis ?", weight: 0.6, theme: Theme.last).photo.attach(io: file, filename: 'template_card_31.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutot des Messi que des Nadal par ici... Enfin sur papier, en vrai on sait tous que vous valez rien", true: "Plutot des Nadal que des Messi par ici... Enfin sur papier, en vrai on sait tous que vous valez rien", question: Question.last)
Tag.create!(false: "Football", true: "Tennis", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_22.jpg')
Question.create!(content: "Livraison à domicile ou Restaurant ? ", weight: 0.3, theme: Theme.last).photo.attach(io: file, filename: 'template_card_22.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt livraison à domicile par ici... Un peu de respect pour vous-meme ca vous dit ? :)", true: "Plutôt restaurant par ici... Je vois qu'on est un groupe qui a les moyens...", question: Question.last)
Tag.create!(false: "Livraison à domicile", true: "Restaurant", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_26.jpg')
Question.create!(content: "Breaking Bad ou Game of Thrones ?", weight: 0.2, theme: Theme.last).photo.attach(io: file, filename: 'template_card_26.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt Breaking Bad par ici... Plus porté sur la drogue que l'heroisme enfait", true: "Plutôt Game of Thrones par ici... Enfin, plutôt pour Daenerys que pour le scenario, on est d'accord", question: Question.last)
Tag.create!(false: "Breaking Bad", true: "Game of Throne", question: Question.last)

User.all.each { |userr| userr.update(:all_answered => true) }
Question.all.each { |question| User.all.each { |userr| Answer.create!(question_id: question[:id], response: true, user: userr) } }
CreateGroup.new.call
