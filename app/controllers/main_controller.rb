class MainController < ApplicationController
  def index
    render :layout => 'homepage'
  end

  def products
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end
end
