class AdminMailer < ApplicationMailer
    default from: "zaritus3@hotmail.com"

    def admin_order_mail(order) 
        @admin = User.find_by(email: "admininthere@yopmail.com")  
        @order = order
        @cart =  @order.cart           
        @user = User.find(@order.user.id)  
                                                            
        @url  = 'http://inthere.fr/login'                                    
        mail(to: @admin.email, subject: 'Nouvelle commande !')            
      end
end
