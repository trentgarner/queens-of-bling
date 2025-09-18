class ModelApplicationsController < ApplicationController
  def new
    @model_application = ModelApplication.new
  end

  def create
    @model_application = ModelApplication.new(model_application_params)
    if @model_application.save
      redirect_to root_path, notice: "Application Submitted!"
    else
      render :new
    end
  end


  private

  def model_application_params
    params.require(:model_application).permit(:name, :email, :phone, :address)
  end
end
