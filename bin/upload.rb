def upload(user_name)
    puts "Submit your photo url or press q to go back to the home page"
    selection = gets.chomp
    case selection
    when "q"
        homepage(user_name)
    else 
        puts "Enter the name of the concert the photo is of"
        concert_name = gets.chomp
        if concert_name
            puts "Caption?"
            caption = gets.chomp

            puts "Upload Complete"
            
        else
            puts "Concert not found please reupload your photo"
            upload(user_name)
        end
    end
end