class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to root_path, notice: "Inquiry submitted!"
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :phone, :business_name, :quantity, :date_needed, :apparel_type, :questions)
  end
end
