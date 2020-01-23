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
        USER.photos[photo_index].display

        puts USER.photos[photo_index].file
        puts "Type edit to edit file name"
        puts "Type delete to delete this photo"
        puts "Type any other key to go back"
        del = gets.chomp
        case del
        when "delete"
            USER.delete_photo(USER.photos[photo_index])
            puts "Aaaaaaaaand it's gone"
            puts "Press any key to go back"
            gets.chomp
            my_photos
        when "edit"
            puts "What should the new file name be?"
            name = gets.chomp
            USER.photos[photo_index].file = name
            USER.photos[photo_index].save
            puts "File updated\n\n"
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