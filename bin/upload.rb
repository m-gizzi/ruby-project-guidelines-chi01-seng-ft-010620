def upload
    system "clear"
    puts "Submit your photo file name or press q to go back to the home page"
  
    @photo_url = gets.chomp
    case @photo_url
    when "q"
        homepage
    else 

        enter_concert
    end
end

def enter_concert
    puts "Enter the name of the concert the photo is of"
    concert_name = gets.chomp
    concert = Concert.find_by(displayName: concert_name)
    if concert
      puts "Caption?"
      caption = gets.chomp
      USER.upload_photo(@photo_url, concert, caption)
      pic = USER.photos.find_by(name: photo_file)

    puts "Upload Complete"
    puts "Press any key to go back"
    gets.chomp
    homepage


            pic.display

            puts "Press any key to go back"
            gets.chomp
            homepage
            
        else
            puts "Concert not found please reupload your photo"
            enter_concert
        end
    end
end


require_relative 'run'