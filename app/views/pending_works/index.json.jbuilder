json.array!(@pending_works) do |pending_work|
  json.extract! pending_work, :id, :starting_time, :user_id, :project_id, :description
  json.url pending_work_url(pending_work, format: :json)
end
