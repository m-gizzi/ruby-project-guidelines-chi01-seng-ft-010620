# def startup
#     system "clear"
#     puts "Welcome to Concertgram!\n\n"
#     puts "Please select an option:\n\n"
#     puts "1. Upload photo"
#     puts "2. Random photo"
#     puts "3. My photos"
#     puts "4. Search"
    
#     selection = gets.chomp

#     case selection
#     when "1"
#     puts "Upload"
#     when "2"
#     random_page
#     end
# end

def random_page
    system "clear"
    puts Photo.random_photo
    puts "\n\n\n\n"
    puts "Press q to return to the homepage, otherwise, press any key for the next photo"
    rand_input = gets.chomp
    case rand_input
    when "q"
        homepage
    else
        random_page
    end
end

def my_photos
    system "clear"
    puts "These are your photos\n\n"
    indices = []
    person = User.find_or_create_by_name($user_name)
    person.photos.each_with_index do |photo, index|
        puts "#{index+1}. #{photo.file}"
        indices << index+1
    end
    puts "\n\n\n\n"
    puts "Choose a photo or press q to return to the homepage"
    my_photo_input = gets.chomp
    # binding.pry
    if indices.include?(my_photo_input.to_i)
        system "clear"
        puts "#{person.photos[my_photo_input.to_i-1].file}"
        gets.chomp
    else
        case my_photo_input
        when "q"
            homepage
        else
            my_photos
        end
    end
end
# Hyacinth Hansen Murray DVM