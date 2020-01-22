require 'pry'

def user_search
    system "clear"
    puts "Enter a username:"
    input = gets.chomp
    puts "\n\n"
    person = User.find_or_create_by_name(input)
    # binding.pry
    if person.photos.count == 0
        puts "No photos for this user"
    end
    person.photos.each do |photo|
        puts photo.file
    end
    puts "\n\n"
    puts "Press any key to go back to search"
    winput = gets.chomp
        case winput
        when "q"
            search
        else
            search
        end
    end

def concert_search
    system "clear"
    puts "Enter a band:"
    input = gets.chomp
    puts "\n\n"
    event = Concert.find_by(displayName: input)
    # binding.pry
    if event.photos.count == 0
        puts "No photos for this concert"
    end
    event.photos.each do |photo|
        puts photo.file
    end
    puts "\n\n"
    puts "Press any key to go back to search"
    winput = gets.chomp
        case winput
        when "q"
            search
        else
            search
        end
    end

# def concert_search
#     system "clear"
#     puts "Enter a band:"
#     input = gets.chomp
#     puts "\n\n"
#     event = Concert.find_by(displayName: input)
#     # binding.pry
#     if event.photos.count == 0
#         puts "No photos for this concert"
#     end
#     event.photos.each do |photo|
#         puts photo.file
#     end
#     puts "\n\n"
#     puts "Press any key to go back to search"
#     winput = gets.chomp
#         case winput
#         when "q"
#             search
#         else
#             search
#         end
#     end


def most_popular
    system "clear"
    puts "#{Concert.most_photographed_concert.displayName} at #{Concert.most_photographed_concert.location} on #{Concert.most_photographed_concert.date}"
    puts "\n\n\n\n"
    puts "Press q to go back to search"
    winput = gets.chomp
        case winput
        when "q"
            search
        else
            most_popular
        end
end

def search
    system "clear"
    puts "Please select an option, or press q to go back to the homepage:\n\n"
    puts "1. Search by user"
    puts "2. Search by concert"
    puts "3. Search by date"
    puts "4. Most popular concert"

    search_input = gets.chomp

    case search_input
    when "1"
        user_search
    when "2"
        concert_search
    when "3"
        system "clear"
        puts "Enter a date"
        input = gets.chomp
    when "4"
        most_popular
    when "q"
        homepage
    else search
    end
end