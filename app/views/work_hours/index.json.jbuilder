json.array!(@work_hours) do |work_hour|
  json.extract! work_hour, :id, :work_date, :quantity, :description
  json.url work_hour_url(work_hour, format: :json)
end
