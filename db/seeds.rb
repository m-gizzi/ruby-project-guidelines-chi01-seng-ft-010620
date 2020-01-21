require 'pry'

User.destroy_all
Concert.destroy_all
Photo.destroy_all


user_list = []
100.times do
    user_list << Faker::Name.name_with_middle
end

user_list.each do |name|
    User.create(name: name)
end

concert_list = []
20.times do
    concert_list << [Faker::Music::RockBand.name, Faker::Address.city, Faker::Date.backward(days: 1000)]
end

concert_list.each do |name, city, date|
    Concert.create(displayName: name, location: city, date: date)
end

user_ids = []
User.all.each do |user|
    user_ids << user.id
end
concert_ids = []
Concert.all.each do |concert|
    concert_ids << concert.id
end

200.times do
    Photo.create(file: Faker::File.file_name(ext: 'jpg'),caption: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, user_id: user_ids.sample, concert_id: concert_ids.sample)
end