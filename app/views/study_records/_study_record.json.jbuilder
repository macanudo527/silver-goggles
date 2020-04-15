json.extract! study_record, :id, :user_id, :entry_id, :mastery, :created_at, :updated_at
json.url study_record_url(study_record, format: :json)
