
def upload(user_name)
    puts "Submit your photo url or press q to go back to the home page"
    photo_url = gets.chomp
    case photo_url
    when "q"
        homepage(user_name)
    else 
        puts "Enter the name of the concert the photo is of"
        concert_name = gets.chomp
        concert = Concert.find_by(displayName: concert_name)
        if concert
            puts "Caption?"
            caption = gets.chomp
            USER.upload_photo(photo_url, concert, caption)

            puts "Upload Complete"
            
            
            
        else
            puts "Concert not found please reupload your photo"
            upload(user_name)
        end
    end
end


require_relative 'run'