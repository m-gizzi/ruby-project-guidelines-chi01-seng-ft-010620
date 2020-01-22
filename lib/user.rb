class User < ActiveRecord::Base
    has_many :photos
    has_many :concerts, through: :photos

    def upload_photo(file, concert, caption = nil)
        new_photo = Photo.create(file: file, caption: caption)
        self.photos << new_photo
        concert.photos << new_photo
        new_photo
    end

    def delete_photo(photo)
        photo.destroy
        self.reload
    end

    def most_photographed_concert
        self.concerts.max_by{|concert| concert.photos.length}
    end


    def photos_by_date(date)
        self.photos.all.select{|photo| photo.created_at.to_date == date}
    end


    def photos_by_concert_name(name)
        self.photos.select{|photo| photo.concert.displayName == name}
    end


end