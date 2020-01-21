class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :concert
    
    def self.photos_by_concert_name(name)
        self.all.select{|photo| photo.concert.name == name}
    end

    def self.photos_by_date(date)
        self.all.select{|photo| photo.created_at.to_date == date}
    end

    def self.random_photo
        self.all.sample
    end

end
