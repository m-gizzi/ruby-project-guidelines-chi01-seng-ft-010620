def homepage
    system "clear"
    puts "Hi #{$user_name}! Please select an option or press q to quit:\n\n"
    puts "1. Upload photo"
    puts "2. Random photo"
    puts "3. My photos"
    puts "4. Search"

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
        system "clear"
        puts "Thank you for using Concertgram"
        exit
    else 
        homepage
    end
end