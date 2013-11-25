  class UsersController < ApplicationController

  before_action :require_current_user, except: [:new, :create]

  respond_to :json
  
  def index
  	@users = User.all
    @message = Message.new  
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render action: :new
    end
  end

  def show
  	@user = User.find(params[:id])
    @message = Message.new
    @messages = Message.all
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path
  end

  def search
    @results = User.search_for params[:search]
    
  end

  private

  def user_params
  	params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :bio, :avatar, :street, :city, :province, :latitude, :longitude, :gmaps)
  end
end
