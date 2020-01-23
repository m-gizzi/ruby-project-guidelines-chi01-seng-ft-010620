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