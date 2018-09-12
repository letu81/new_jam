class ApiV1::AddressesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user_from_token!

	def index
		@addresses = Address.active.where(user_id: current_user.id)
		respond_to do |format|
	      format.json
	    end
    	render layout: false
	end

	def show
		@address = Address.where(user_id: current_user.id, id: params[:id]).first
		respond_to do |format|
	      format.json
	    end
    	render layout: false
	end

	def create
		@address = Address.new(user_id: params[:user_id], mobile: params[:mobile], 
		  username: params[:username], address: params[:address], province_id: params[:province_id],
		  city_id: params[:city_id], district_id: params[:district_id])
		if @address.valid? && @address.save
			return { code: 0, message: "ok" }
		else
			return { code: 1, message: @address.errors.full_messages.to_sentence }
		end
	end

	def update
		@address = Address.where(user_id: current_user.id, id: params[:id]).first
		if @address && @address.update({mobile: params[:mobile], username: params[:username], 
			address: params[:address], province_id: params[:province_id], 
			city_id: params[:city_id], district_id: params[:district_id]})
			return { code: 0, message: "ok" }
		else
			return { code: 1, message: @address.errors.full_messages.to_sentence }
		end
	end

	def set_default
		@address = Address.where(user_id: current_user.id, id: params[:id]).first
		if @address && @address.update_attribute(:is_default, true)
			Address.where("user_id=? and id!=?", current_user.id, params[:id]).update_all("is_default = false")
			return { code: 0, message: "ok" }
		else
			return { code: 1, message: "更新失败，没有找到对应地址" }
		end
	end

    def destory
    	@address = Address.where(user_id: current_user.id, id: params[:id]).first
    	if @address && @address.update_attribute(:disable, true)
			return { code: 0, message: "ok" }
		else
			return { code: 1, message: "删除失败" }
		end
    end

  private
    def authenticate_user_from_token!
	    if params[:auth_token].present?
	      	user = User.find_by_authentication_token(params[:auth_token])
	      	sign_in(user, store: false) if user
	    end
	    if current_user.nil?
	    	render json: { code: 1, message: "请登录" }, status: 401
	    end
    end
end