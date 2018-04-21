class Category < ActiveRecord::Base
    has_many :projeto_categories
    has_many :projetos, through: :projeto_categories
    has_many :poi_categories
    has_many :pois, through: :poi_categories
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
end