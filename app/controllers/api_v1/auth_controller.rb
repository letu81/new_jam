class ApiV1::AuthController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!, :only => [:logout]

	def login
    	success = false
    	if params[:email] && params[:password]
	      user = User.find_by_email( params[:email] )
	      success = user && user.valid_password?( params[:password] )
        end

	    if success
	      render :json => { :auth_token => user.authentication_token, :user_id => user.id }
	    else
	      render :json => { :message => "手机号或密码错误" }, :status => 401
	    end                        
	end

	def logout
	    current_user.generate_authentication_token
	    current_user.save!

	    render :json => { :message => "Ok" }
	end
end