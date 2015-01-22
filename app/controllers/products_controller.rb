class ProductsController < ApplicationController
	def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create

  	$moredetails = "de"

  	$i = 1
  	$num = params[:moredetailsno].to_i


  	while $i <= $num  do
  		$tempname = params["Fieldname"+$i.to_s]
  		$tempcontent = params["Fieldcontent"+$i.to_s]

  		if($tempname!=nil)
		   	if($i==1)
		   		$moredetails = $moredetails + $tempname + "^" + $tempcontent
		   	else
		   		$moredetails = $moredetails + "~" +$tempname + "^" + $tempcontent 
		   	end
		  end
		  $i +=1
		end

  	@product = Product.new( :ProductName => params[:product][:ProductName],
      							:ProductKeyword => params[:product][:ProductKeyword],
      							:ProductCategoryId => params[:ProductCategoryId],
      							:ProductSubCategory => params[:ProductSubCategory],
      							:ProductCategorization => params[:ProductCategorization],
      							:ModelNo => params[:product][:ModelNo],
      							:BrandName => params[:product][:BrandName],
      							:MoreDetails => $moredetails,
      							:MinimumOrder => params[:product][:MinimumOrder],
      							:SupplyAbility => params[:product][:SupplyAbility],
      							:QuotedPrice => params[:product][:QuotedPrice],
      							:PaymentTerms => params[:product][:PaymentTerms],
      							:DeliveryTime => params[:product][:DeliveryTime],
      							:PackagingDetails => params[:product][:PackagingDetails],
      							:DetailedDesciption => params[:product][:DetailedDesciption],
      							:Approved => "false")


      @product.save
      @product.pictures.create(:caption => "",
                        :image => params[:product][:pictures][:image])

      @product.pictures.create(:caption => "",
                        :image => params[:product][:pictures][:image1])

      @product.pictures.create(:caption => "",
                        :image => params[:product][:pictures][:image2])

  		redirect_to @product
  end
end
