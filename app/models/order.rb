class Order < ApplicationRecord
  after_create :order_mail

  belongs_to :user
  belongs_to :cart
  has_many :products, through: :cart

  validates :cart, uniqueness: true  

  def order_mail
	  UserMailer.purchase_email(self).deliver_now
  end
  def admin_order_send
    AdminMailer.admin_order_send(self).deliver_now
  end
end
