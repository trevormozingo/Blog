class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email].downcase, password: params[:session][:password])

		if user
      		log_in user
      		redirect_to :controller => 'welcome', :action => 'home' 
      	else
      		redirect_to :controller => 'welcome', :action => 'index'
      	end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end



































