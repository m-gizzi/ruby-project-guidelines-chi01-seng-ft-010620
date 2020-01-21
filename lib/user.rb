class User < ActiveRecord::Base
    has_many :photos
    has_many :concerts, through: :photos

    def upload


end