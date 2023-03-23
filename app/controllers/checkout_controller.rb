class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d                                                 
    @session = Stripe::Checkout::Session.create(                                     
      payment_method_types: ['card'],
      shipping_address_collection: {
        allowed_countries: ['FR'],
        },
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: cart_checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',            
      cancel_url: cart_checkout_cancel_url                                                    
    )                                                                                
    redirect_to @session.url, allow_other_host: true                                 
  end

  def success                                                                   
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])                
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)   
    @cart = Cart.find(params[:cart_id])
    @order = Order.new(cart_id:@cart.id, user:current_user,stripe_id:@session.id)   
    if @order.save
       @cart.order_id = @order.id
       @cart.save 
       @cart = Cart.create(user_id: current_user.id)
       flash[:success] = "Le payement a été réalisé avec succès !"
       redirect_to order_path(@order.id)
    else
      redirect_to panier_path(@cart.id)
      flash[:info] = "Ton payement est bien passé mais il y a un problème pour enregistrer ta participation. Contactez-nous"
    end
  end

  def cancel                                                                          
  end                                                                               
end