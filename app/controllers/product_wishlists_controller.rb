class ProductWishlistsController < ApplicationController
  def destroy
    @product_wishlist = ProductWishlist.find(params[:id])
    @product_wishlist.destroy
    flash[:info] = "Produit retiré de votre wishlist"
    redirect_to products_path
  end
end
