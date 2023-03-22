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


category_title_create = ["earbuds", "drones", "telephones", "montres"]
images_chat=["https://m.media-amazon.com/images/I/61TXDYujoQL._AC_UL320_.jpg", 
	"https://m.media-amazon.com/images/I/51RKBYPavSL._AC_UL320_.jpg",
	"https://m.media-amazon.com/images/I/51P0D-ZgyVL._AC_UL320_.jpg", 
	"https://https://m.media-amazon.com/images/I/61PlEd+bbBL._AC_UL320_.jpg", 
	"https://images-eu.ssl-images-amazon.com/images/I/712v3RNGS9L._AC_UL600_SR600,400_.jpg", 
	"https://images-eu.ssl-images-amazon.com/images/I/81f09IHHjnL._AC_UL600_SR600,400_.jpg", 
	"https://images-eu.ssl-images-amazon.com/images/I/71m5wk1Fi3L._AC_UL600_SR600,400_.jpg", 
	"https://images-eu.ssl-images-amazon.com/images/I/51sV-rg4KqL._AC_UL600_SR600,400_.jpg",
	"https://images-eu.ssl-images-amazon.com/images/I/712v3RNGS9L._AC_UL600_SR600,400_.jpg",  
	"https://images-eu.ssl-images-amazon.com/images/I/81f09IHHjnL._AC_UL600_SR600,400_.jpg"]

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
      category: Category.first
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



