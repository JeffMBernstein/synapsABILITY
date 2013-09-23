class WelcomeController < ApplicationController

	def index
		session[:user_id] = nil
		@user = User.new
	end
end
