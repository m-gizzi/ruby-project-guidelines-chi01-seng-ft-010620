class Concert < ActiveRecord::Base
    has_many :photos
    has_many :users, through: :photos
    

    def self.most_photographed_concert
        self.all.max_by{|concert| concert.photos.length}
    end

    

end