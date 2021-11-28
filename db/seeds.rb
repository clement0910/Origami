file = URI.open('https://www.kp-skills.com/assets/jean-romain_krupa-2c953a2da4ffdaa14ed9185359d49aca9769a8baee551a7b36768c2afa34688f.jpg')
user = User.new(first_name: "admin", last_name: "admin", email: "admin@admin.fr", password: "admin00", gender: "homme", city: "Lyon", birthday: Date.today)
user.photo.attach(io: file, filename: 'Jeanro.jpg', content_type: 'image/jpg')
user.save

Theme.create!(name: "Personnalité")
Question.create!(content:"Dîner posé entre amis ou sortie en boîte ?", weight: 1, theme: Theme.last)
Question.create!(content:"Plutôt jeux vidéo ou jeux de société ?", weight: 0.5, theme: Theme.last)
Question.create!(content:"Extraverti ou introverti ?", weight: 0.8, theme: Theme.last)
Question.create!(content:"Superstitieux ou rationnel ?", weight: 0.7, theme: Theme.last)
Question.create!(content:"Es tu amateur d’humour au second degré  ?", weight: 0.9, theme: Theme.last)
Question.create!(content:"Team Sport ou Team Canapé ?", weight: 0.6, theme: Theme.last)
Question.create!(content:"Team Beer-Pong ou Ping-Pong ?", weight: 0.1, theme: Theme.last)
Question.create!(content:"Plutôt Mojito ou Virgin Mojito ?", weight: 0.85, theme: Theme.last)
Question.create!(content:"Te considères-tu comme écolo ?", weight: 0.3, theme: Theme.last)
Question.create!(content:"Plutôt Bière ou Vin ? ", weight: 0.4, theme: Theme.last)
Question.create!(content:"Tenue décontractée ou casual chic ?", weight: 0.7, theme: Theme.last)
Question.create!(content:"Passes tu beaucoup de temps sur les réseaux ?", weight:0.7, theme: Theme.last)
Question.create!(content:"Chat ou Chien ?", weight: 0.1, theme: Theme.last)
Question.create!(content:"Sortie Musée/Expo ou Concert/Festival ?", weight: 0.8, theme: Theme.last)
Question.create!(content:"Lecteur du dimanche ou grand lecteur ?", weight: 0.8, theme: Theme.last)
Question.create!(content:"Travail de groupe ou travai en solo ?", weight: 0.8, theme: Theme.last)
Theme.create!(name: "Littérature")
Question.create!(content:"Bandes dessinées ou Romans ?", weight: 0.3, theme: Theme.last)
Question.create!(content:"Pour t'informer, plutôt réseaux sociaux ou journaux ?", weight: 0.5, theme: Theme.last)
Question.create!(content:"Tintin ou One Peace ?", weight: 0.3, theme: Theme.last)
Theme.create!(name: "Musique")
Question.create!(content:"Veux-tu te connecter à Spotify ?", weight: 0.0, theme: Theme.last)
Question.create!(content:"Grand mélomane ou simple amateur de musique ?", weight: 0.4, theme: Theme.last)
Theme.create!(name: "Gastronomie")
Question.create!(content:"Livraison à domicile ou Restaurant ? ", weight: 0.3, theme: Theme.last)
Question.create!(content:"Plutôt Street-Food ou Gastronomie ?", weight: 0.4, theme: Theme.last)
Question.create!(content:"Home-made ou Plats préparés ?", weight: 0.5, theme: Theme.last)
Theme.create!(name: "Culture Cinéma")
Question.create!(content:"Séries ou films ?", weight: 0.2, theme: Theme.last)
Question.create!(content:"Breaking Bad ou Game of Thrones ?", weight: 0.2, theme: Theme.last)
Question.create!(content:"Kaamelott ou Friends ?", weight: 0.6, theme: Theme.last)
Question.create!(content:"Les Tuche ou OSS 117 ?", weight: 0.6, theme: Theme.last)
Question.create!(content:"James Bond ou Avengers", weight: 0.4, theme: Theme.last)
Theme.create!(name: "Sport")
Question.create!(content:"Sport collectif ou sport individuel ?", weight: 0.7, theme: Theme.last)
Question.create!(content:"Football ou Tennis ?", weight: 0.6, theme: Theme.last)
Question.create!(content:"Esprit Compétition ou Mental de collaboration ?", weight: 0.6, theme: Theme.last)
Chatroom.create!(name: "Groupe d'amis")
Message.create!(content: "Comment ils vont alors ceux-la?", chatroom: Chatroom.last, user: User.last)