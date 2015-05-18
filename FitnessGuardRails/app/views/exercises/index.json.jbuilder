json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :erklaerung
  json.url exercise_url(exercise, format: :json)
end
