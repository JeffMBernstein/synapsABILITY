class ServicesController < ApplicationController
	def show
    @service = Service.find(params[:id])   
  end

  def index
    @services = Service.all
    @service = Service.new
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
    	flash[:error] = "Failed to create service."
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
	  @service = Service.find(params[:id])
		  if @service.update(params[:service])
		    redirect_to(@service)
		  else
		    render :edit
	  end
	end

  def destroy 
    @service = Service.find(params[:id])
    @service.destroy
      redirect_to services_path
    end

  def service_params
    params.require(:service).permit(:name, :phone, :description, :email, :service_id, :website, :street, :city,  :avatar, :province, :latitude, :longitude, :gmaps)
  end
end
