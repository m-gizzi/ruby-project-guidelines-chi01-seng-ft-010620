class User < ActiveRecord::Base
    has_many :photos
    has_many :concerts, through: :photos

    def self.find_or_create_by_name(name)
        self.find_by(name: name) || self.create(name: name)
    end

    def upload_photo(file, concert, caption = nil)
        new_photo = Photo.create(file: file, caption: caption)
        self.photos << new_photo
        concert.photos << new_photo
        new_photo
    end

    def delete_photo(photo)
        photo.delete
        self.reload
    end

    def most_photographed_concert
        self.concerts.max_by{|concert| concert.photos.length}
    end


    def photos_by_date(date_as_string)
        validated = date_as_string.to_date
        self.photos.select{|photo| photo.created_at.to_date == validated}
    end


    def photos_by_concert_name(name)
        self.photos.select{|photo| photo.concert.displayName == name}
    end


end