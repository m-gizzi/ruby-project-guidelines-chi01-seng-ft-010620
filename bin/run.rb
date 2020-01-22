require_relative '../config/environment'
require_relative 'helper_methods_matthew.rb'
require 'pry'

system "clear"
puts "Welcome to Concertgram!\n\n"
puts "Please select an option:\n\n"
puts "1. Upload photo"
puts "2. Random photo"
puts "3. My photos"
puts "4. Search"

selection = gets.chomp

case selection
when "1"
    puts "Upload"
when "2"
    random_page
end

#ascii = ASCII_Image.new("http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png")
#ascii.build(60)

#puts ascii