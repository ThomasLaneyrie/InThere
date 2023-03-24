FactoryBot.define do
    factory :user do
      first_name { "John" }
      last_name { "Doe" }
      email { "toto@example.com" }    
      id {1}
    end
  end