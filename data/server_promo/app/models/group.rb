class Group < ApplicationRecord
    has_many :poi_groups
    has_many :pois, through: :poi_groups

    has_one_attached :avatar
end
