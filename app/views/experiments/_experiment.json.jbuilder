json.extract! experiment, :id, :primary_id, :user_id, :title, :created_at, :updated_at
json.url experiment_url(experiment, format: :json)
