class PoiSerializer < ActiveModel::Serializer
  attributes :id, :title, :onCallout, :address, :lat, :lng, :url 

  def title
	object.name
  end
  def orCallout
	object.string
  end
  def lat
	object.latitude
  end
  def lng
	object.longitude
end
end
