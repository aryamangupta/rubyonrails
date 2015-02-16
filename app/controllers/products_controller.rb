class ProductsController < ApplicationController
	def index
    @products = Product.all
  end

  def new
    @category = Category.uniq.pluck(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
  	@product = Product.new( :ProductName => params[:product][:ProductName],
      							:ProductKeyword => params[:product][:ProductKeyword],
      							:ModelNo => params[:product][:ModelNo],
      							:BrandName => params[:product][:BrandName],
      							:MinimumOrder => params[:product][:MinimumOrder],
      							:SupplyAbility => params[:product][:SupplyAbility],
      							:QuotedPrice => params[:product][:QuotedPrice],
      							:PaymentTerms => params[:product][:PaymentTerms],
      							:DeliveryTime => params[:product][:DeliveryTime],
      							:PackagingDetails => params[:product][:PackagingDetails],
      							:DetailedDesciption => params[:product][:DetailedDesciption],
      							:Approved => "false")
      @product.category = Category.find_by_subsubcategory params[:subsubcategory]
      @product.save

      moredetails = "de"

      i = 1
      num = params[:moredetailsno].to_i

      while i <= num  do
        tempname = params["Fieldname"+i.to_s]
        tempcontent = params["Fieldcontent"+i.to_s]

        if(tempname!=nil)
          @product.specifications[tempname] = tempcontent
        end
        i +=1
      end

      params[:textspec].each_pair do |key, value|
        @product.specifications[key] = value
      end

      params[:checkboxspec_name].each_key do |key|
        checkbox_options = ""
        params[key].each_key do |checkbox_option|
          if checkbox_options.nil?
            checkbox_options = checkbox_option
          else
            checkbox_options = "#{checkbox_options},#{checkbox_option}"
          end
        end
        @product.specifications[key] = checkbox_options unless checkbox_options.nil?
      end
      
      params[:dropdownspec].each_pair do |key, value|
        @product.specifications[key] = value
      end

      @product.pictures.create(:caption => "", :image => params[:product][:pictures][:image])
      @product.pictures.create(:caption => "", :image => params[:product][:pictures][:image1])
      @product.pictures.create(:caption => "", :image => params[:product][:pictures][:image2])

      redirect_to @product
  end
end
