json.array!(@tracks) do |track|
  json.extract! track, :id, :starting_point_id, :name, :night_track, :map_link, :km, :comments
  json.url track_url(track, format: :json)
end
