class PoiGroup < ActiveRecord::Base
    belongs_to :poi
    belongs_to :group
end