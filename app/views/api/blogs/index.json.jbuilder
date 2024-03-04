json.partial! partial: 'success'
json.response do
  json.meta @meta
  json.body @blogs.map do |blog|
    json.id blog.id
    json.author blog.author
    json.title blog.title
    json.desc blog.desc
  end
end