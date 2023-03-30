class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy ]
  before_action :check_if_admin, only: %i[new edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end
  # show of each Category
  def category
    @category = Category.find(params[:id])
    @products = Category.find(params[:id]).products
  end 

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find_by(title: params[:title])
    @comment = Comment.new
    @comments = @product.comments
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    product_params["category_id"] = product_params["category_id"].to_i
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save

        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update

    respond_to do |format|
    
      if @product.update(product_params)

        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy

    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by(title: params[:title])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image_url, :category_id, :top_sell, :color, :brand)
    end

    def wishlist_button
      binding.pry
      @product = Product.find(params[:id])
    end
end
