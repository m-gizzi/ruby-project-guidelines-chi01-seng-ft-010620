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
    Photo.random_photo
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
    USER.photos.each_with_index do |photo, index|
        puts "#{index+1}. #{photo.file}"
    end

    puts "\n\n\n\n"

    puts "Choose a photo or press q to return to the homepage"
    my_photo_input = gets.chomp
    photo_index = my_photo_input.to_i - 1
    if USER.photos.length >  photo_index && photo_index >= 0
        system "clear"
        # Display photo
        USER.photos[photo_index].display

        puts USER.photos[photo_index].file
        puts "Type delete to delete this photo or any other key to go back"
        del = gets.chomp
        case del
        when "delete"
            USER.delete_photo(USER.photos[photo_index])
            puts "Aaaaaaaaand it's gone"
            puts "Press any key to go back"
            gets.chomp
            my_photos
        else my_photos
        end
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
