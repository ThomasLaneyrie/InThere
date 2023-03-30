module ApplicationHelper

  def product_is_in_one_of_your_wishlist?(this_product)
    this_product.wishlists.each do |wishlist|
      if current_user == wishlist.user
        return true
      end
    end
    return false
  end

  def find_associated_product_wishlist_id(this_product)
    associated_wishlist = this_product.wishlists.find_by(user: current_user)
    product_wishlist = associated_wishlist.product_wishlists.find_by(product:this_product )
    return product_wishlist
  end

end

