# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([{name: 'Breanna Webster'}, {email: 'b.webster@gmail.com'}, {password_digest: 'Welcome'}])
DreamJournal.create([{title:'Dreams of 2020'}, {user_id: 1}])
Dream.create([{name:'Nomad'},  {description: 'I had a dream that I lived in Europe'}, {reflections: 'I have been thinking about being a digital nomad, so this could have been a subconscious thought'}, {date: Date.today}, {dream_journals_id: 1}])
