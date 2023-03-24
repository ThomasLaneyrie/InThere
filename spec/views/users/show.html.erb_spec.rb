require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe "users/show.html.erb", type: :view do

  context 'it displays the user information' do
    it "displays 'Mes informations'" do
      # dit à la view que @user sera le build d'un utilisateur qui arrive sur la page profil et voit le champ "Mes informations"
      assign(:user, build(:user))
  
      # génère la vue (ceci doit être fait après avoir assigné la variable d'instance, pour qu'il puisse la trouver)
      render
  
      # la vue rendered doit afficher l'email passé
      expect(rendered).to match /toto@example.com/
    end
  end

end
