class Landmark < ApplicationRecord
    has_many :poi_landmarks
    has_many :pois, through: :poi_landmarks

end
