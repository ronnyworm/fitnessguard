json.array!(@runs) do |run|
  json.extract! run, :id, :date, :participants, :km, :duration, :max_pulse, :comments, :map_link
  json.url run_url(run, format: :json)
end
