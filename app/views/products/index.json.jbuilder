json.carousels @carousels do |image|
  json.url image.url(:large)
end

json.products @products do |product|
  json.id product.id
  json.title truncate(strip_tags(product.title), length: 8)
  json.intro truncate(strip_tags(product.intro), length: 12)
  if product.images.size > 0
    json.image product.images.first.url(:small)
  else
    json.image ""
  end
end