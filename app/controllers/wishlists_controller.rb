class WishlistsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def create
    chosen_product = Product.find(params[:product_id])
    if current_user.wishlists == []
      @wishlist = Wishlist.new(user: current_user, title: "ma nouvelle wishlist")               # Evolution mutli-wishlist si possible: sélectionner la wishlist qu'on veut, prend le dernier pour le moment
      if @wishlist.save
      else
        redirect_to root_path
      end
    else
      @wishlist = current_user.wishlists.last                                   # Evolution mutli-wishlist si possible: sélectionner la wishlist qu'on veut, prend le dernier pour le moment
    end
    @ProductWishlist = ProductWishlist.create(wishlist:@wishlist, product:chosen_product)
    redirect_back(fallback_location: root_path)
  end
end

