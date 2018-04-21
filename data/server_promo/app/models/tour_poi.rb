class TourPoi < ActiveRecord::Base
    belongs_to :poi
    belongs_to :tour
end