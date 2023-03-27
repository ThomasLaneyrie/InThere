class SearchController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products2 = @q.result(distinct: true)
  end
end
