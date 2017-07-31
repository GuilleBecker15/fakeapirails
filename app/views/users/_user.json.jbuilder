json.extract! user, :id, :name, :username, :email, :pass, :address, :city, :phone, :website, :company, :created_at, :updated_at
json.url user_url(user, format: :json)
