json.partial! partial: 'success'
json.response do
  json.body do
    json.blog do
      json.author @blog.author
      json.title @blog.title
      json.desc @blog.desc
    end
  end
end