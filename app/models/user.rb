class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

   
  has_many :orders
  has_many :carts
  has_one_attached :avatar
  has_many :comments

  after_create :welcome_email
  def welcome_email
    UserMailer.welcome_email(self).deliver_now            
  end 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end

end
