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

real_files = ["9197417o.jpg", "10375055aj.jpg", "10903868-3x2-700x467.jpg", "23826198_10155876862269183_4570214473339026698_o.jpg",
"BTSSY_0518US_09.jpg", "file-20181123-149703-2hfkuv.jpg", "gettyimages-506033809.jpg", "INXS_LIVE_BABY_LIVE_2000-696x442.jpg", "IRON-MAIDEN-credit2-John-McMurtrie-1024x640.jpg",
"LDN-L-RAMMSTEIN-0121-1.jpg", "mastodon_01.jpg", "mcr2.jpg", "mcr3.jpg", "nektar-band-live-concert-photo-3.jpg", "picex.jpg", "s705193702859866969_p1_i2_w500.jpeg", 
"the-norwegian-black-metal-band-gorgoroth-performs-a-live-concert-at-KTF9Y7.jpg", "Webp.net-resizeimage-14-2.jpg", "winner-november-12-2018-006.jpg", "yq-watain-07032010_2x_2x.jpg"]

200.times do
    Photo.create(file: real_files.sample,caption: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, user_id: user_ids.sample, concert_id: concert_ids.sample)
end