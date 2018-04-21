class Poi < ActiveRecord::Base
    geocoded_by :address
    after_validation :geocode
    has_many :businesses
    has_many :poi_categories
    has_many :categories, through: :poi_categories
    has_many :tour_pois
    has_many :tours, through: :tour_pois
    has_many :poi_groups
    has_many :groups, through: :poi_groups
    has_many :poi_landmarks
    has_many :landmarks, through: :poi_landmarks


    searchkick locations: [:location]
    
    has_one_attached :avatar

    def search_data
        attributes.merge location: { lat: latitude, lon: longitude }    
    end
    
end
