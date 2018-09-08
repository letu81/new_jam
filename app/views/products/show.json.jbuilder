json.current_product do
  json.id @product.id
  json.title @product.title
  json.intro @product.intro
  json.description raw(@product.description.gsub("/uploads/redactor2_assets/images", "#{Redactor2RailsImageUploader.asset_host}/uploads/redactor2_assets/images"))
  json.images @product.images do |image|
	  json.url image.url(:large)
  end
end

json.products @hot_products do |product|
  json.id product.id
  json.title truncate(strip_tags(product.title), length: 8)
  json.intro truncate(strip_tags(product.intro), length: 12)
  if product.images.size > 0
    json.image product.images.first.url(:small)
  else
    json.image ""
  end
end