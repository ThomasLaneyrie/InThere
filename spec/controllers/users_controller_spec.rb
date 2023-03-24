require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  describe "GET show" do
    it "assigns @user" do
      user = User.create(email: "toto@test.fr", password: "password")
      sign_in user # sign in the user before making the request
      
      get :show, params: { id: user.id }
  
      expect(assigns(:user)).to eq(user)
    end
  
    it "renders the show template" do
        user = User.create(email: "toto@test.fr", password: "password")
        sign_in user # sign in the user before making the request

        get :show, params: { id: user.id }
  
        expect(response).to render_template("show")
    end
  end
end
  