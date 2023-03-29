class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def create
    chosen_product = Product.find(params[:product_id])
    if current_user.wishlists == []
      # Evolution mutli-wishlist si possible: sélectionner la wishlist qu'on veut, prend le dernier pour le moment
      @wishlist = Wishlist.new(user: current_user, title: "ma nouvelle wishlist")         
      if @wishlist.save
        flash[:success] = "Création de votre wishlist"
      else
        flash[:info] = "Impossible d'ajouter à la wishlist"
      end
    else
      # Evolution mutli-wishlist si possible: sélectionner la wishlist qu'on veut, prend le dernier pour le moment
      @wishlist = current_user.wishlists.last         
    end
    @ProductWishlist = ProductWishlist.create(wishlist:@wishlist, product:chosen_product)
    redirect_back(fallback_location: root_path)
  end
end

