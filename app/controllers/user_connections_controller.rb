class UserConnectionsController < ApplicationController
	before_action :require_current_user

	def index
		@connections = UserConnection.all.select { |connection| connection.user_id == @current_user.id }
		
		connection_ids = Array.new
		@connections.each do |connection|
			connection_ids << connection.connection_id
		end

		@current_user_connections = User.find(connection_ids)
	end
	
	def new
		if params[:connection_id]
			@connection = User.find(params[:connection_id])
			@user_connection = @current_user.user_connections.new(connection: @connection)
		else
			flash[:error] = "Connection Required"
		end
	end

	def user_connections_params
		params.require(:user_connection).permit(:user_id, :connection_id, :connection_status)
	end

	def create 
		if params[:user_connection] && params[:user_connection].has_key?(:connection_id)
			@connection = User.find(params[:user_connection][:connection_id])
			@user_connection = @current_user.user_connections.new(user_connections_params)
			if @user_connection.save
				flash[:success] = "Your connection request was sent."
				redirect_to user_path(@connection)
			else
				flash[:error] = "Failed to save connection"
				redirect_to users_path
			end
		else
			flash[:error] = "Connection Required"
			redirect_to users_path
		end
	end

	def accept_user_connection
		if params[:id]
			@user_connection = UserConnection.find(params[:id])
			@user_connection.connection_status = 1
			if @user_connection.save
				flash[:success] = "Successfully accepted request"
			else 
				flash[:error] = "Failed to add connection"
			end
			redirect_to user_connections_path
		end
	end
	# rescue ActiveRecord::RecordNotFound
	# 	render file: 'public/404', status: :not_found
	# end

end