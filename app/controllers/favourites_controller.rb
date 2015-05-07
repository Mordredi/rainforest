class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites.all
  end

  def create
    # @favourite = current_user.favourites.build(product_id: params[:product_id])
    @favourite = Favourite.find_or_create_by(user_id: current_user.id, product_id: params[:product_id])
    # binding.pry
    # @favourite.product = Product.find(params[:id])
    if @favourite.save && @favourite.product_id.present?
      redirect_to products_path
    else
      render 'products/index'
    end
  end

  private

  # def favourite_params
  #   params.require(:favourite).permit(:product_id)
  # end
end
