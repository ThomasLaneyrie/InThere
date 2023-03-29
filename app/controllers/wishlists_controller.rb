class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def create
    chosen_product = Product.find(params[:product_id])
    if current_user.wishlists == []
      @wishlist = Wishlist.new(user: current_user, title: "ma nouvelle wishlist")              # A ajouter : définir le nom de sa wishlist
      if @wishlist.save
        flash[:success] = "Création de votre wishlist"
      else
        #faire un truc
      end
    else
      @wishlist = current_user.wishlists.last                                                        # A ajouter : sélectionner la wishlist qu'on veut, prend le dernier pour le moment
    end

    @ProductWishlist = ProductWishlist.create(wishlist:@wishlist, product:chosen_product)
    redirect_to wishlist_path(@wishlist.id)
  end
end


