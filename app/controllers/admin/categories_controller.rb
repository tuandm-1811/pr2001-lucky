class Admin::CategoriesController < Admin::BaseController 
	def index
		@categories = Category.all.page(params[:page]).per(3)
	end
	def show
		@category = Category.find(params[:id])
		@products = @category.products.page(params[:page]).per(3)
	end
	def new
		@category = Category.new 
	end
	def create
		@category = Category.new category_params
		if @category.save
			flash[:success] = "Add successfully"
			redirect_to new_admin_product_path
		else
			render :new
		end
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:success] = "Update successfully"
			redirect_to admin_categories_path
		else
			render :edit
		end
	end
	def destroy
		@category = Category.find_by id: params[:id]
		@category.destroy
		redirect_to request.referrer || root_url
	end
	private
	def category_params
		params.require(:category).permit :name_category
	end
end
