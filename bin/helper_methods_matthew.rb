def startup
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
end

def random_page
    system "clear"
    puts Photo.random_photo
    puts "\n\n\n\n"
    puts "Press q to return to the homepage, otherwise, press any key for the next photo"
    rand_input = gets.chomp
    case rand_input
    when "q"
        startup
    else
        random_page
    end
end