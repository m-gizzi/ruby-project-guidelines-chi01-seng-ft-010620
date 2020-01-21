require 'Faker'

user_list = []
100.times do
    user_list << Faker::Name.name_with_middle
end

# user_list.each do |name|
#     User.create(name: name)
# end

concert_list = []
10.times do
    concert_list << [Faker::Music::RockBand.name, Faker::Address.city, Faker::Date.backward(days: 1000)]
end

# concert_list.each do |name, city, date|
#     User.create(displayName: name, location: city, date: date)
# end

p concert_list