require_relative '../config/environment'
require 'pry'

puts "HELLO WORLD"

#ascii = ASCII_Image.new("http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png")
#ascii.build(60)

#puts ascii
jake = User.all.find_by(id: 1)
pic = Photo.all.find_by(id: 5)
con = Concert.all.find_by(id: 3)
binding.pry
