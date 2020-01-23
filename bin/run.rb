require_relative '../config/environment'
require_relative 'search.rb'
require_relative 'helper_methods_matthew.rb'
require_relative 'upload.rb'

# require_relative '../pictures/picex'
require 'pry'
require 'RMagick'
# images = Magick::Image.read(picex.jpg)
# images[0].display

  
system "clear"
puts "Welcome to Concertgram!\n\n"

puts "Please enter a username"
$user_name = gets.chomp
USER = User.find_or_create_by_name($user_name)
def homepage
    system "clear"
    puts "Hi #{$user_name}! Please select an option:\n\n"
    puts "1. Upload photo"
    puts "2. Random photo"
    puts "3. My photos"
    puts "4. Search"
    puts "q. Quit"

    selection = gets.chomp

    case selection
    when "1"
        upload
    when "2"
        random_page
    when "3"
        my_photos
    when "4"
        search
    when "q"
        puts "Thank you for using Concertgram"
        exit
    else 
        homepage
    end
end

homepage
#ascii = ASCII_Image.new("http://www.levihackwith.com/wp-content/uploads/2011/10/github-logo.png")
#ascii.build(60)

#puts ascii