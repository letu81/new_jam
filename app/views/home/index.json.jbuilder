json.carousels @carousels do |image|
  json.url request.protocol + request.host + image.url(:large)
end

json.products @products do |product|
  json.id product.id
  json.title product.title
  json.intro product.intro
  if product.images.size > 0
    json.image request.protocol + request.host + product.images.first.url(:small)
  else
    json.image ""
  end
end

json.customize @customizes do |product|
  json.id product.id
  json.title product.title
  json.intro product.intro 
  if product.images.size > 0
    json.image request.protocol + request.host + product.images.first.url(:small)
  else
    json.image ""
  end
end

json.partners @partners, :id, :title, :web_url