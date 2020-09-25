# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
comedies = Category.create(name: "comedies")
dramas = Category.create(name: "dramas")
Video.create(title: "futurama", description: 'space travel', small_cover_url: 'futurama', category: comedies, created_at: 1.day.ago)
Video.create(title: "monk", description: 'paranoic detective', small_cover_url: 'monk', category: comedies, created_at: 1.day.ago)
Video.create(title: "family guy", description: 'Petter Griffin', small_cover_url: 'family_guy',category: dramas, created_at: 1.day.ago)
Video.create(title: "south park", description: 'hippie kids', small_cover_url: 'south_park', category: dramas, created_at: 1.day.ago)

Video.create(title: "futurama", description: 'space travel', small_cover_url: 'futurama', category: comedies, created_at: 1.day.ago)
Video.create(title: "monk", description: 'paranoic detective', small_cover_url: 'monk', category: comedies, created_at: 1.day.ago)
Video.create(title: "family guy", description: 'Petter Griffin', small_cover_url: 'family_guy', category: dramas, created_at: 1.day.ago)
Video.create(title: "south park", description: 'hippie kids', small_cover_url: 'south_park', category: dramas, created_at: 1.day.ago)

Video.create(title: "futurama", description: 'space travel', small_cover_url: 'futurama',category: comedies, created_at: 1.day.ago)
Video.create(title: "monk", description: 'paranoic detective', small_cover_url: 'monk', category: comedies, created_at: 1.day.ago)
Video.create(title: "futurama", description: 'space travel', small_cover_url: 'family_guy',category: comedies, created_at: 1.day.ago)
monk=Video.create(title: "monk", description: 'paranoic detective', small_cover_url: 'monk',category: comedies, created_at: 1.day.ago)

kevin = User.create(full_name: "Kevin Wang", password: "password", email: "kevin@sample.com")
Review.create(user: kevin, video: monk, rating: 5, content: "this is a really good movie!")
Review.create(user: kevin, video: monk, rating: 2, content: "this is a good movie!")