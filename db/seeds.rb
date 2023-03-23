# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Category.destroy_all
Product.destroy_all
Cart.destroy_all
Order.destroy_all
ProductCart.destroy_all

nb_cart = 10
nb_product = 10     # Laisser 10 car une image prévue par Product ! 
nb_category = 3     # Laisser 3 car une category prévue par category !  
nb_product_cart = 20
nb_order = 10
nb_user = 10

carts = []
products = []
categories = []
product_carts = []
orders = []
users = []


category_title_create = ["Ordinateurs", "Téléphones", "Accessoires"]
images_chat=["https://zoosante.fr/wp-content/uploads/2020/02/collier-anti-puces-chat-300x300.jpg", 
	"https://letourno.com/wp-content/uploads/2021/02/Nourriture-pour-chat-500x500.jpg",
	"https://www.art-deco-stickers.fr/968-tm_large_default/sticker-mural-chaton.jpg", 
	"https://www.monchatestroi.fr/wp-content/uploads/2016/03/Amiti%C3%A9-chien-chat-Chien-qui-l%C3%A8che-un-chat.jpg", 
	"https://mycrazystuff.com/16610-thickbox/criniere-de-lion-pour-chat.jpg", 
	"https://www.catedogshop.com/wp-content/uploads/2020/10/jouet-balle-cataire-catnip-herbe-chat-chaton-7-300x300.jpg", 
	"https://img.le-dictionnaire.com/chat.jpg", 
	"https://www.ifop.com/wp-content/uploads/2020/07/chiens-et-chats-300x300.jpeg",
	"https://cdn.shopify.com/s/files/1/0053/2289/9530/products/coussin-chat-rayures-canape_2000x.jpg?v=1652907836",  
	"https://jardinjasmin.com/wp-content/uploads/2017/01/87729-B-500x500.png"]

#seeding des users "creation des users"
User.create(email:"admininthere@yopmail.com", password:"123456", is_admin: true)

nb_user.times do |x|
	user = User.create(
		email: Faker::Internet.email,
		password: "password",
		first_name: Faker::Books::Dune.planet,
		last_name: Faker::Books::Dune.city,
		address: Faker::Address.street_address,
		city: Faker::Address.city,
		zip_code: Faker::Address.zip_code,
		is_admin: false,
    alert_on: false
		)
		users << user
 	puts "Seeding user nb#{x}"
end

#seeding d'une catégorie
  i = 0
	nb_category.times do |x|
		category = Category.create(
		title: category_title_create[i]
		)
		categories << category
    puts "Seeding category nb#{x}"
    i += 1
  end

#seeding des Products
  i = 0
  nb_product.times do |x|
    product = Product.create(
      title: Faker::Creature::Animal.name,
      description: Faker::Lorem.words(number: 4, exclude_words: 'error'),
      price: rand(1..20),
      image_url: images_chat[i],
      category: Category.all.sample
      )
    products << product
    puts "Seeding product nb#{x}"
    i = i + 1
  end

#seeding des carts "paniers"

	nb_cart.times do |x|
		cart = Cart.create(
			user_id: users[rand(0..nb_user-1)].id
			)
		carts << cart
		puts "Seeding cart nb#{x}"
	end

#seeding des orders "commandes aprés panier"

	i = 0
	nb_order.times do |x|
		order = Order.create(
			stripe_id: "stripe_id_random",
			user_id: users[rand(0..nb_user-1)].id,
			cart: carts[i]
		)
		orders << order
		puts "Seeding order nb#{x}"
		i = i + 1
	end
	
#seeding des product_carts "table de jointure"

	nb_product_cart.times do |x|
		product_cart = ProductCart.create(
			quantity: rand(1..10),
			cart_id: carts[rand(0..nb_cart-1)].id,
			product_id: products[rand(0..nb_product-1)].id
		)
		product_carts << product_cart
		puts "Seeding product_cart nb#{x}"
	end



