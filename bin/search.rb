require 'pry'

def user_search
    system "clear"
    puts "Enter a username:"
    input = gets.chomp
    puts "\n\n"
    person = User.find_by(name: input)
    if person == nil
        puts "No users with this name"
        puts "Press any key to go back to search"
        result = gets.chomp
        if result
            search
        end
    elsif person.photos.count == 0
        puts "No photos for this user"
    else
        person.photos.each do |photo|
        puts photo.file
        end
    end
    puts "\n\n"
    puts "Press any key to go back to search"
    winput = gets.chomp
        if winput
            search
        end
end

def concert_search
    system "clear"
    puts "Enter a band:"
    input = gets.chomp
    puts "\n\n"
    event = Concert.find_by(displayName: input)
    if event == nil
        puts "No concerts for this band"
        puts "Press any key to go back to the search menu"
        result = gets.chomp
        if result
            search
        end
    elsif event.photos.count == 0
        puts "No photos for this concert"
    else
        def concert_photos(input,event)
            system "clear"
            puts "Here are the photos of #{input}\n\n"
            event.photos.each_with_index do |photo, index|
                puts "#{index+1}. #{photo.file}"
            end
        
            puts "\n\n\n\n"
        
            puts "Choose a photo or press q to return to the search menu"
            my_photo_input = gets.chomp
            photo_index = my_photo_input.to_i - 1
            if event.photos.length >  photo_index && photo_index >= 0
                system "clear"
                event.photos[photo_index].display
        
                puts event.photos[photo_index].file
                gets.chomp
                concert_photos(input,event)
            elsif my_photo_input == "q"
                search
            else
                concert_search
            end
        end
        concert_photos(input,event)
    end

    puts "\n\n"
    puts "Press any key to go back to the search menu"
    gets.chomp
    search 
end

def date_search
    binding.pry
    begin
    system "clear"
    puts "Enter a date:"
    input = gets.chomp
    validated = input.to_date
    puts "\n\n"
    event = Concert.find_by(date: validated)
    if event == nil
        puts "No concerts on this date"
        puts "Press any key to go back to search"
        result = gets.chomp
        if result
            search
        end
    elsif event.photos.count == 0
        puts "No photos for this concert"
    else
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
    rescue
        puts "Please enter a date"
        puts "Press any key to return to search"
        input = gets.chomp
        date_search
    end
    end


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
        date_search
    when "4"
        most_popular
    when "q"
        homepage
    else search
    end
end