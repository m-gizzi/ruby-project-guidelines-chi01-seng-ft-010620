require_relative '../config/environment'
require_relative 'upload'
require_relative 'helper_methods_matthew.rb'
require 'pry'

system "clear"
puts "Welcome to Concertgram!\n\n"

puts "Please enter a username"
user_name = gets.chomp
USER = User.find_or_create_by_name(user_name)
system "clear"

def homepage(user_name)
    puts "Hi #{user_name}! Please select an option:\n\n"
    puts "1. Upload photo"
    puts "2. Random photo"
    puts "3. My photos"
    puts "4. Search"
    puts "5. Quit"


    selection = gets.chomp






    case selection
    when "1"
        upload(user_name)
    when "2"
        random_page
    when "3"
        my_photos(user_name)
    when "4"
        search
    when "5"
        puts "Thank you for using Concertgram"
        exit
    else 
        homepage(user_name)
    end
end
homepage(user_name)


#ascii = ASCII_Image.new("http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png")
#ascii.build(60)

#puts ascii