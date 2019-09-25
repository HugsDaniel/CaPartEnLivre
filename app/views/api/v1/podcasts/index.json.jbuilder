json.array! @podcasts do |podcast|
  json.extract! podcast, :id, :title, :publisher, :description
end
