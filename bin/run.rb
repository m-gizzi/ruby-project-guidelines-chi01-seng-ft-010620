require_relative '../config/environment'


puts "HELLO WORLD"

ascii = ASCII_Image.new("http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png")
ascii.build(60)

puts ascii
