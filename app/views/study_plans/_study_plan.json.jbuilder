json.extract! study_plan, :id, :user_id, :plan_name, :created_at, :updated_at
json.url study_plan_url(study_plan, format: :json)
