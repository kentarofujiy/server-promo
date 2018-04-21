class Tour < ApplicationRecord
    has_many :tour_pois
    has_many :pois, through: :tour_pois
    has_many :user_tours
    has_many :users, through: :user_tours
    has_one_attached :avatar
end
