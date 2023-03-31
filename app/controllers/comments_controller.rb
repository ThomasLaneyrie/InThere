class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @product = Product.find(params[:format])
    @comments = @product.comments
  end

  # GET /comments/1 or /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @product = @comment.product
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @product = Product.find(comment_params[:product_id])
    @comment.product_id = @product.id
    respond_to do |format|
      if @comment.save
        number_comments_for_this_product = Comment.all.where(product:@product).count
        # format.html { redirect_to product_path(@product.title), notice: "Comment was successfully created." }
        # format.json { render :show, status: :created, location: @comment }
        format.turbo_stream do 
          render turbo_stream: [turbo_stream.prepend("all_comments", @comment),
                                turbo_stream.update("number_comments", number_comments_for_this_product)]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      #format.turbo_stream { render turbo_stream: turbo_stream.append_to("live-comments", @comment) }
      format.html { redirect_to products_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content, :note, :user_id, :product_id)
    end
end
