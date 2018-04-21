json.extract! poi, :id,  :string, :address, :created_at, :updated_at, :category_ids
json.url poi_url(poi, format: :json)
json.title poi.name
json.onCallout poi.string 
json.lat poi.latitude 
json.lng poi.longitude 
json.avatar url_for(poi.avatar)
json.promotions poi.tours do | promotion |
    ## json.promotion_name promotion.name
    ## json.promotion_avatar promotion.avatar
 json.partial! "tours/tour", tour: promotion
end
