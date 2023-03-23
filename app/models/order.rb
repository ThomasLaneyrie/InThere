class Order < ApplicationRecord
  after_create :order_mail

  belongs_to :cart
  belongs_to :user

  validates :cart, uniqueness: true  

  def order_mail
	  UserMailer.purchase_email(self).deliver_now
  end
end
