class LandmarkSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :details, :avatar
end
