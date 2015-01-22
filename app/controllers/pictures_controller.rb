class PicturesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @picture = @product.pictures.create(:caption => "",
      									:image => params[:product][:pictures][:image])
    redirect_to article_path(@product)
  end
end
