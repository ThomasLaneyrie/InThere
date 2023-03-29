module ApplicationHelper

  def product_is_in_one_of_your_wishlist?(this_product)
    this_product.wishlists.each do |wishlist|
      if current_user == wishlist.user
        return true
      end
    end
    return false
  end

end

