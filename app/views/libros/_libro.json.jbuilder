json.extract! libro, :id, :nombre, :editorial, :fechaPub, :autor_id, :created_at, :updated_at
json.url libro_url(libro, format: :json)
