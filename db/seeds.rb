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

file = File.open('app/assets/images/d26e914731d46c385896ed79f7c4300b.jpg')
user = User.new(first_name: "Cassandra", last_name: "Yok", email: "cassandra@gmail.com", password: "bot000", gender: "Femme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6), description: "rap ou rien (love damso)")
user.photo.attach(io: file, filename: 'd26e914731d46c385896ed79f7c4300b.jpg', content_type: 'image/jpg')
user.save

file = File.open('app/assets/images/9D432273-1C7D-4512-82BE-0645055A92F7.jpg')
user = User.new(first_name: "Clément", last_name: "Sapt", email: "clement@gmail.com", password: "admin00", gender: "Homme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6), description: "j'adore chopin et vivaldi mais damso un peu vulgaire")
user.photo.attach(io: file, filename: '9D432273-1C7D-4512-82BE-0645055A92F7.jpg', content_type: 'image/jpg')
user.save

file = File.open('app/assets/images/gael.jpg')
user = User.new(first_name: "Gael", last_name: "Tardy", email: "gael@gmail.com", password: "admin00", gender: "Homme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6), description: "j'adore bien mange et le pastis avec les copains")
user.photo.attach(io: file, filename: 'gael.jpg', content_type: 'image/jpg')
user.save

file = File.open('app/assets/images/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f49505042514362573746443354673d3d2d3436343833323332382e313465306166363465646165653666393731303437313233353235332e6a7067.jpeg')
user = User.new(first_name: "Laura", last_name: "Cache", email: "laura@gmail.com", password: "bot000", gender: "Femme", city: "Lyon", birthday: DateTime.new(2001,2,3,4,5,6), description: "followez moi sur instagram: lewagon")
user.photo.attach(io: file, filename: '68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f49505042514362573746443354673d3d2d3436343833323332382e313465306166363465646165653666393731303437313233353235332e6a7067.jpeg', content_type: 'image/jpeg')
user.save

Theme.create!(name: "Questions Algorithme")

file = File.open('app/assets/images/template_cards/template_card_0.jpg')
Question.create!(content: "Ready ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_0.jpg', content_type: 'image/jpg')

file = File.open('app/assets/images/template_cards/template_card_25.jpg')
Question.create!(content: "Films ou séries ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_25.jpg', content_type: 'image/jpg')
Tag.create!(false: "Film", true: "Séries", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_8.jpg')
Question.create!(content: "Plutôt Mojito ou Virgin Mojito ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_8.jpg', content_type: 'image/jpg')
Tag.create!(false: "Mojito", true: "Virgin mojito", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_10.jpg')
Question.create!(content: "Plutôt Bière ou Vin ? ", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_10.jpg', content_type: 'image/jpg')
Tag.create!(false: "Biere", true: "Vin", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_21.jpg')
Question.create!(content: "Simple amateur de musique ou grand mélomane ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_21.jpg', content_type: 'image/jpg')
Tag.create!(false: "Amateur de musique", true: "Grand mélomane", question: Question.last)

Theme.create!(name: "Questions Bot")

file = File.open('app/assets/images/template_cards/template_card_24.jpg')
Question.create!(content: "Home-made ou Plats préparés ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_24.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt home-made par ici... Healthy, vegan, yes-life etc... Vous parlez en hashtag aussi j'imagine ?", true: "Plutôt plats préparés par ici... Une bonne team de Tanguy", question: Question.last)
Tag.create!(false: "Home-made", true: "Plats préparés", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_12.jpg')
Question.create!(content: "Sortie Musée/Expo ou Concert/Festival ?", weight: 1, theme: Theme.last).photo.attach(io: file, filename: 'template_card_12.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt musées/expos par ici... un groupe de pedant parisiens ca s'annonce bien...", true: "plutot concerts/festivals par ici... Des adeptes de drogues en tout genre du coup", question: Question.last)
Tag.create!(false: "Musée/Expo", true: "Concert/Festival", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_7.jpg')
Question.create!(content: "Team Beer-Pong ou Ping-Pong ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_7.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Je vois qu'on a un groupe d'alcoolique ici. Pourquoi pas un barathon après le beer-pong", true: "Je vois que tout le monde prefere le ping-pong à l'alcool... que des gens chiant enfait", question: Question.last)
Tag.create!(false: "Beer-Pong", true: "Ping-pong", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_6.jpg')
Question.create!(content: "Team Sport ou Team Canapé ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_6.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "On a une team sport ici. Si quelqu'un fait plus de 100kg, on pourra faire croire que c'est du muscle", true: "je vois qu'on a une team canapé ici... Concours de graisse ? :)", question: Question.last)
Tag.create!(false: "Team Sport", true: "Team Canapé", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_2.jpg')
Question.create!(content: "Dîner entre amis ou sortie en boîte ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_2.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "On prefere les diners plutot que sortir ici? alors comme ca on a + de 50 ans?", true: "Alors comme ca on aime se tremousser sur le dancefloor par ici ?", question: Question.last)
Tag.create!(false: "Dîner entre amis", true: "Sortie en boîte", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_31.jpg')
Question.create!(content: "Football ou Tennis ?", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_31.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutot des Messi que des Nadal par ici... Enfin sur papier, en vrai on sait tous que vous valez rien", true: "Plutot des Nadal que des Messi par ici... Enfin sur papier, en vrai on sait tous que vous valez rien", question: Question.last)
Tag.create!(false: "Football", true: "Tennis", question: Question.last)

file = File.open('app/assets/images/template_cards/template_card_22.jpg')
Question.create!(content: "Livraison à domicile ou Restaurant ? ", weight: 0, theme: Theme.last).photo.attach(io: file, filename: 'template_card_22.jpg', content_type: 'image/jpg')
SentenceBot.create!(false: "Plutôt livraison à domicile par ici... Un peu de respect pour vous-meme ca vous dit ? :)", true: "Plutôt restaurant par ici... Je vois qu'on est un groupe qui a les moyens...", question: Question.last)
Tag.create!(false: "Livraison à domicile", true: "Restaurant", question: Question.last)

User.all.each { |userr| userr.update(:all_answered => true) }
Question.all.each { |question| User.all.each { |userr| Answer.create!(question_id: question[:id], response: true, user: userr) } }
CreateGroup.new.call
