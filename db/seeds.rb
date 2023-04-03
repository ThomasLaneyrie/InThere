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

category_title_create = ["Earbuds", "Montres", "Audio", "Drones"]
category_link = ["https://i.postimg.cc/MGQfMm5v/cat4earbuds.png", 
	"https://i.postimg.cc/XYWzDsG0/cat3.png", 
	"https://i.postimg.cc/nL0Y2k7T/cat2.png", 
	"https://i.postimg.cc/9f4vHrpd/cat1.png"]
images_produits_create = [
	"https://i.postimg.cc/90hKFPVH/700-x-470-earbud-1.jpg",
	"https://i.postimg.cc/HsWvZkkz/700-x-470-earbud-2.jpg",
	"https://i.postimg.cc/DZd569VR/700-x-470-earbud-3.jpg",
	"https://i.postimg.cc/MTxmn9c5/700-x-470-earbud-4.jpg",
	"https://i.postimg.cc/V6YXf5TH/700-x-470-watch1.jpg",
	"https://i.postimg.cc/ncsBcyRZ/700-x-470-watch2.jpg",
	"https://i.postimg.cc/nrNsDLRx/700-x-470-watch3.jpg",
	"https://i.postimg.cc/nLnX7gkX/700-x-470-watch4.jpg",
	"https://i.postimg.cc/xCCqpmBY/700-x-470-enceintes1.jpg",
	"https://i.postimg.cc/L5g52pHb/700-x-470-enceintes2.jpg",
	"https://i.postimg.cc/xTHGPrK5/700-x-470-enceintes3.jpg",
	"https://i.postimg.cc/438p3Xgf/700-x-470-enceintes4.jpg",
	"https://i.postimg.cc/HkXY6zxb/700-x-470-drone-4.jpg",
	"https://i.postimg.cc/3NG8zF1M/700-x-470-drone-3.jpg",
	"https://i.postimg.cc/DZJnbPtW/700-x-470-drone-2.jpg",
	"https://i.postimg.cc/JnkCh4kZ/700-x-470-drone-1.jpg",
	]
title_produits_create = ["E-SPORT","GAMING","WATERPROOF","MUSIC","MEOONLEY","VDSOW","ZOSKVEE","SMARTW","AUNA WOOD", "AUNA BLACK",	"HARMooN", 	"HARMooN XL", 	"FPV",	"DJU WESH 3", "DJU FIZZ 2 SE", "DJU FIZZ 3 Pro"]

nb_cart = 10
nb_product = images_produits_create.count 
nb_category = category_title_create.count     
nb_product_cart = 20
nb_order = 2
nb_user = 2

carts = []
products = []
categories = []
product_carts = []
orders = []
users = []

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
		title: category_title_create[i],
		link: category_link[i]
		)
		categories << category
    puts "Seeding category nb#{x}"
    i += 1
  end

	category_produits_create=
[Category.find_by(title:"Earbuds"), Category.find_by(title:"Earbuds"), Category.find_by(title:"Earbuds"), Category.find_by(title:"Earbuds"),
	Category.find_by(title:"Montres"), Category.find_by(title:"Montres"), Category.find_by(title:"Montres"), Category.find_by(title:"Montres"),
	Category.find_by(title:"Audio"), Category.find_by(title:"Audio"), Category.find_by(title:"Audio"), Category.find_by(title:"Audio"),
	Category.find_by(title:"Drones"), Category.find_by(title:"Drones"), Category.find_by(title:"Drones"), Category.find_by(title:"Drones")
]

#seeding des Products
i = 0
   nb_product.times do |x|
    product = Product.create(
      title: title_produits_create[i],
      description: Faker::ChuckNorris.fact,
      price: rand(4..120),
      image_url: images_produits_create[i],
		  category: category_produits_create[i],
			top_sell: rand(0..1),
			color: Faker::Color.color_name,
			brand: Faker::Company.name
      )
    products << product
    puts "Seeding product nb#{x}"
	i += 1
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



