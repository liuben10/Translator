json.array!(@translate_tasks) do |translate_task|
  json.extract! translate_task, :id, :name, :source_language, :destination_language, :country, :owner_id, :translator_id
  json.url translate_task_url(translate_task, format: :json)
end
