class ProductsController < ApplicationController

  before_action :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search]
      @products = Product.where("LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)",
                                "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    @products = @products.page(params[:page])

    respond_to do |format|
      format.html do
        if request.xhr?
         render @products
        end
      end
      format.js
    end

    @favourites = current_user.favourites

  end

  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to user_products_path, :notice => "Product successfully created"
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @product = Product.find(params[:id])
  end

  def update
    @user = current_user
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

end