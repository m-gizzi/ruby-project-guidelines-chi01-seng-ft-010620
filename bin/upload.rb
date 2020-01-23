
def upload
    system "clear"
    puts "Submit your photo file name or press q to go back to the home page"
    photo_file = gets.chomp
    case photo_file
    when "q"
        homepage
    else 
        puts "Enter the name of the concert the photo is of"
        concert_name = gets.chomp
        concert = Concert.find_by(displayName: concert_name)
        if concert
            puts "Caption?"
            caption = gets.chomp
            USER.upload_photo(photo_file, concert, caption)
            pic = USER.photos.find_by(name: photo_file)

            puts "Upload Complete"

            pic.display

            puts "Press any key to go back"
            gets.chomp
            homepage
            
        else
            puts "Concert not found please reupload your photo"
            upload
        end
    end
end


require_relative 'run'