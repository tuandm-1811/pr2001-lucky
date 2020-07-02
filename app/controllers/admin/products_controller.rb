class Admin::ProductsController < Admin::BaseController
	def index
		@products =  Product.all
	end
	def new
		@product = Product.new
	end
	def show
		@product = Product.find(params[:id])
	end
	def create
		@product = Product.new product_params
		if @product.save
			flash[:success] = "create successful product"
			redirect_to admin_products_path
		else
			flash[:alert] = "Product could not be created!"
			render :new
		end
	end
	def edit
		product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if product.update(product)
			flash[:success] = "update successfuly"
			redirect_to admin_product_path
		else
			render :edit
		end
	end
	def destroy
		@product = Product.find_by id: params[:id]
		@product.destroy
		redirect_to admin_products_path
	end
	private
	def product_params
		params.require(:product).permit :name_product,:information ,:price,:type
	end
end
