if @address
    json.code 0
	json.id @address.id
	json.usernname @address.username
	json.mobile @address.mobile
	json.address @address.address
    json.province @address.province
    json.city @address.city
    json.district @address.district
	json.is_default @address.is_default? ? true : ''
else
	json.code 1
	json.message '没有找到对应地址'
end