require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(email: "toto@test.fr", password: "password")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without email" do
        bad_user = User.create(last_name: "Doe")
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#password" do
      it "should not be valid without any password" do
        bad_user = User.create(first_name: "John")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "carts" do
      it "should have_many carts and many orders" do
        cart = Cart.create(user: @user)
        User.create(email: 'admininthere@yopmail.com', password: '123456')
        expect(@user.carts.include?(cart)).to eq(true)
        order = Order.create(user: @user, cart: cart)
        expect(@user.orders.include?(order)).to eq(true)

      end
    end

  end

end
