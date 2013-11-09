class ServicesController < ApplicationController
	def show
    @service = Service.find(params[:id])   
  end

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    
  end

  def create
    @service = Service.new(service_params)
      @service.save
      redirect_to services_path
    end

  def edit
    @service = Service.find(params[:id])
  end
 
  def update
    @service = Service.find(params[:id])
      if @service.update(params[:service].permit(:title, :text))
        redirect_to @service notice: "Successfully updated Service."
      else
        render 'edit'
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
