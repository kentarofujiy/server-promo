class PoiLandmark < ActiveRecord::Base
    belongs_to :poi
    belongs_to :landmark
end