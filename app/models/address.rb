class Address < ApplicationRecord
	belongs_to :user

    validates :username, :address, :post_code, presence: true
	validates :mobile, format: { with: /\A1[3|4|5|7|8][0-9]\d{4,8}\z/, message: "请输入11位正确手机号" }, length: { is: 11 },
            :presence => true  


    scope :active, -> { where(disable: false) }

    def province
    	self.province_id.blank? ? "" : ChinaRegion::Region.get(self.province_id.to_s.first(2)).name
    end

    def city
    	self.city_id.blank? ? "" : ChinaRegion::Region.get(self.city_id.to_s.first(4)).name
    end

    def district
    	self.district_id.blank? ? "" : ChinaRegion::Region.get(self.district_id.to_s).name
    end
  
    def as_json(opts = {})
	    {
	      id: self.id,
	      username: self.username || "",
	      mobile: self.mobile || "",
	      address: self.address || "",
	      post_code: self.post_code || "",
	      is_default: self.is_default? ? true : ''
	    }
    end
end