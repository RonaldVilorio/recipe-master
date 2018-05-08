class Rating < ApplicationRecord
    belongs_to :recipe
    belongs_to :user
    # class method to retrieve rating.stars.highest / rating.stars.lowest
    def self.highest_stars
        self.where('stars >= 3')
    end
    def self.lowest_stars
        self.where('stars <= 2')
    end
end
