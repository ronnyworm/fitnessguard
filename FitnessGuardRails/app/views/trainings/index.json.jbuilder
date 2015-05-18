json.array!(@trainings) do |training|
  json.extract! training, :id, :date, :duration
  json.url training_url(training, format: :json)
end
