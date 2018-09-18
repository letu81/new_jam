if @address
    json.code 0
	json.address_data do
		json.id @address.id
	  	json.mobile @address.mobile
	  	json.username @address.username
		json.address @address.address
		json.post_code @address.post_code
	end
    json.province @address.province
    json.province_id @address.province_id
    json.city @address.city
    json.city_id @address.city_id
    json.district @address.district
    json.district_id @address.district_id
	json.is_default @address.is_default? ? true : ''
else
	json.code 1
	json.message '没有找到对应地址'
end