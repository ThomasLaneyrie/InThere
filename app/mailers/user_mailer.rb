class UserMailer < ApplicationMailer
  default from: 'zaritus3@hotmail.com'    

  def welcome_email(user)               
    @user = user                                                         
    @url  = 'http://monsite.fr/login'                                    
    mail(to: @user.email, subject: 'Bienvenue chez nous !')            
  end

  def purchase_email(order)
		@order = order
		@cart = @order.cart
		mail(to: @order.user.email, subject: 'Récapitulatif de votre commande')
	end

end