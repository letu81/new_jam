json.addresses @addresses do |address|
  json.id address.id
  json.username address.username
  json.mobile address.mobile
  json.address address.address
  json.is_default address.is_default? ? true : ''
end