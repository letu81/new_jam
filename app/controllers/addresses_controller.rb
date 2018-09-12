class AddressesController < ApplicationController
	def index
		@addresses = Address.active.where(user_id: params[:user_id])
		respond_to do |format|
	      format.json
	    end
    	render layout: false
	end

	def show
		@address = Address.where(user_id: params[:user_id], id: params[:id]).first
		respond_to do |format|
	      format.json
	    end
    	render layout: false
	end

	def create

	end

	def update
		@address = Address.where(user_id: params[:user_id], id: params[:id]).first
		@address.update(params[:address])
	end

    def destory
    	@address = Address.where(user_id: params[:user_id], id: params[:id]).first
    	@address.update_attribte(disable: true)
    end
end