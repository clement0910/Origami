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


