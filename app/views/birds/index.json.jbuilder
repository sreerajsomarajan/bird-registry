json.array!(@birds) do |bird|
  json.extract! bird, :id, :name, :family, :continents, :added, :visible
  json.url bird_url(bird, format: :json)
end
