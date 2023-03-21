class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  # validates :cart, uniqueness: true  
end
