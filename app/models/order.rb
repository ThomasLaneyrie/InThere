class Order < ApplicationRecord
  after_create :order_mail
  after_create :admin_order_mail

  belongs_to :user
  belongs_to :cart
  has_many :products, through: :cart

  validates :cart, uniqueness: true  

  def order_mail
	  UserMailer.purchase_email(self).deliver_now
  end
  def admin_order_mail
    AdminMailer.admin_order_mail(self).deliver_now
  end
end
