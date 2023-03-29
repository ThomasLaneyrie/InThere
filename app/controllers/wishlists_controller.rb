class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def create
    chosen_product = Product.find(params[:product_id])
    if current_user.wishlists == []
      # A modifier : définir le nom de sa wishlist
      @wishlist = Wishlist.new(user: current_user, title: "ma nouvelle wishlist")         
      if @wishlist.save
        flash[:success] = "Création de votre wishlist"
      else
        flash[:info] = "Impossible d'ajouter à la wishlist"
      end
    else
      # A modifier : sélectionner la wishlist qu'on veut, prend le dernier pour le moment
      @wishlist = current_user.wishlists.last         
    end
    @ProductWishlist = ProductWishlist.create(wishlist:@wishlist, product:chosen_product)
    flash[:success] = "Ajouté à votre wishlist avec succès"

    # redirect_to products_path
    respond_to do |format| 
      format.turbo_stream do 
        render turbo_stream: [turbo_stream.replace("wishlist_product")]
      end
    end
  end
end


