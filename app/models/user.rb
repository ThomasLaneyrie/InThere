class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   
  has_many :orders
  has_many :carts
  has_one_attached :avatar

  after_create :welcome_email
  def welcome_email
    UserMailer.welcome_email(self).deliver_now            
  end 
end
