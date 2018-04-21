json.extract! group, :id, :name, :created_at, :updated_at
json.url group_url(group, format: :json)
json.avatar url_for(group.avatar)
json.pois group.pois do | poi |
    json.partial! "pois/poi", poi: poi
end
