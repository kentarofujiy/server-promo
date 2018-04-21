json.extract! tour, :id, :created_at, :updated_at
json.avatar url_for(tour.avatar)
json.url tour_url(tour, format: :json)
json.title tour.name
## json.poi_id @tour_poi.latitude