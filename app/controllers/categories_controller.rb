class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @q_filter = Product.where(category: Category.find(params[:id])).ransack(params[:q])                         
    @products = @q_filter.result(distinct: true)           
  end
end
