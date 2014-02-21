class UserConnectionsController < ApplicationController
	before_action :require_current_user
	
	def new
		if params[:connection_id]
			@connection = User.find(params[:connection_id])
			@user_connection = @current_user.user_connections.new(connection: @connection)
		else
			flash[:error] = "Connection Required"
		end
	end

	def user_connections_params
		params.require(:user_connection).permit(:user, :connection, :user_id, :connection_id)
	end

	def create 
		if params[:user_connection] && params[:user_connection].has_key?(:connection_id)
			@connection = User.find(params[:user_connection][:connection_id])
			@user_connection = @current_user.user_connections.new(user_connections_params)
			@user_connection.save
			flash[:success] = "YOU ARE NOW FRIENDS"
			redirect_to user_path(@connection)
		else
			flash[:error] = "Connection Required"
			redirect_to users_path
		end
	end
	# rescue ActiveRecord::RecordNotFound
	# 	render file: 'public/404', status: :not_found
	# end

end