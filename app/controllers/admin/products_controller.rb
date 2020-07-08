# frozen_string_literal: true

class Admin::ProductsController < Admin::BaseController
	before_action :get_product ,only: [:show , :edit , :update]
  def index
    @products = Product.all.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'create successful product'
      redirect_to admin_products_path
    else
      flash[:alert] = 'Product could not be created!'
      render :new
    end
  end

  def edit   
  end

  def update
    if @product.update product_params
      flash[:success] = 'Update Successfuly'
      redirect_to admin_categories_path
    else
    	flash[:alert] = 'Product could not be Update'
      render :edit
    end
  end

  def destroy
    @product = Product.find_by id: params[:id]
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit :name_product, :information, :price, :type, :category_id
  end
  def get_product
  	@product = Product.find(params[:id])
  end
end
