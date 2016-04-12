json.array!(@symboles) do |symbole|
  json.extract! symbole, :id
  json.url symbole_url(symbole, format: :json)
end
