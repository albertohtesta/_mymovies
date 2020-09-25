require 'faker'

Fabricator(:category) do
	name { Faker::Lorem.words(5) }
end