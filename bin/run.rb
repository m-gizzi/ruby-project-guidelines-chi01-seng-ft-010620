require_relative '../config/environment'
require_all 'bin'
require 'pry'
require 'RMagick'

  
system "clear"
puts "Welcome to Concertgram!\n\n"

puts "Please enter a username"
$user_name = gets.chomp
USER = User.find_or_create_by_name($user_name)

homepage