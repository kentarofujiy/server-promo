json.extract! user, :email
json.user_tour @user_tours.name
json.tours user.tours do | tour |
    json.partial! "tours/tour", tour: tour
end
