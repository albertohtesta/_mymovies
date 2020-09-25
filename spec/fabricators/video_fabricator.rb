require 'faker'

Fabricator(:video) do
	title { Faker::Lorem.words(5) }
	description { Faker::Lorem.paragraph(2) }
	small_cover_url {"monk"}
	large_cover_url {"monk"}
	category
end