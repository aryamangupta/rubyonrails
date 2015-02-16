class CompaniesController < ApplicationController
  respond_to :html

  def new
    @page_title = "Sign Up to Bizongo"
    @company ||= Company.new(params[:company])
    @company.users.build
  end

  def create
    @company = Company.new
    @company.name = company_params[:name]
    @company.business_type = company_params[:business_type]
    @company.address = company_params[:address]
    @company.city = company_params[:city]
    @company.pincode = company_params[:pincode]
    @company.state = company_params[:state]
    @company.country = company_params[:country]
    @company.contact_number = company_params[:contact_number]
    @company.users_attributes = company_params[:users_attributes]
    @company.save

    if @company.errors.empty?
      redirect_to verify_company_url(@company)
    else
      render action: 'new'
    end
  end

  def verify
    @company = Company.find params[:id]
    @user = @company.users.first
  end

  private

  def company_params
    params[:company].permit(:name, :business_type, :address, :city, :pincode, :state, :country, :contact_number, users_attributes: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
