def upload
    system "clear"
    puts "Submit your photo file name or press q to go back to the home page"
  
    @photo_file = gets.chomp
    case @photo_file
    when "q"
        homepage
    else 

        enter_concert
    end
end

def enter_concert
    puts "Enter the name of the concert the photo is of or press q to go back to the homepage"
    concert_name = gets.chomp
    concert = Concert.find_by(displayName: concert_name)
    if concert_name == "q"
        homepage
    end
    if concert
        puts "Caption?"
        caption = gets.chomp
        USER.upload_photo(@photo_file, concert, caption)
        pic = USER.photos.find_by(file: @photo_file)

        puts "Upload Complete"

            pic.display

            puts "Press any key to go back"
            gets.chomp
            homepage
            
        else
            puts "Concert not found please try again"
            enter_concert
        end


require_relative 'run'