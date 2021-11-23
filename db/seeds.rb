# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
file = URI.open('https://www.kp-skills.com/assets/jean-romain_krupa-2c953a2da4ffdaa14ed9185359d49aca9769a8baee551a7b36768c2afa34688f.jpg')
user = User.new(first_name: "admin", last_name: "admin", email: "admin@admin.fr", password: "admin00", gender: "homme", city: "Lyon", birthday: Date.today)
user.photo.attach(io: file, filename: 'Jeanro.jpg', content_type: 'image/jpg')
user.save
Theme.create!(name: "Musique")
Question.create!(content:"aime tu crazyfrog ?", theme: Theme.last)
Question.create!(content:"aime tu grenouillefolle ?", theme: Theme.last)
Question.create!(content:"aime tu booba ?", theme: Theme.last)
Question.create!(content:"aime tu Chopin ?", theme: Theme.last)
Theme.create!(name: "Sport")
Question.create!(content:"aime tu nager ?", theme: Theme.last)
Question.create!(content:"aime tu boxer ?", theme: Theme.last)
Question.create!(content:"aime tu danser ?", theme: Theme.last)
Question.create!(content:"aime tu courrir ?", theme: Theme.last)
Theme.create!(name: "Cinema/Serie")
Question.create!(content:"aime tu breaking bad ?", theme: Theme.last)
Question.create!(content:"aime tu netflix?", theme: Theme.last)
Question.create!(content:"aime tu aller au cinema", theme: Theme.last)
Question.create!(content:"aime tu les films en noir et blanc", theme: Theme.last)
Theme.create!(name: "Gastronomie")
Question.create!(content:"aime tu le domac ?", theme: Theme.last)
Question.create!(content:"aime tu les resto a 500 boules ?", theme: Theme.last)
Question.create!(content:"aime tu les maxi tacos ?", theme: Theme.last)
Question.create!(content:"aime tu les brocolis ?", theme: Theme.last)
Theme.create!(name: "Loisirs")
Question.create!(content:"aime tu les jeux video ?", theme: Theme.last)
Question.create!(content:"aime tu boire enormement?", theme: Theme.last)
Question.create!(content:"aime tu changer de slip tous les jours ?", theme: Theme.last)
Question.create!(content:"aime tu prendre des douches ?", theme: Theme.last)
