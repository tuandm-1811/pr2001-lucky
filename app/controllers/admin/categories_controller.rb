# frozen_string_literal: true

class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i[edit update]
  def index
    @categories = Category.all.page(params[:page]).per(5)
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Add successfully'
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Add fails'
      render :new
    end
  end
  def edit; end
  def update
    if @category.update(category_params)
      flash[:success] = 'Update successfully'
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Update fails'
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

  def set_category
    @category = Category.find(params[:id])
  end
end
