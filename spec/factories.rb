FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # confirmed_at Time.now # required if the Devise Confirmable module is used
  end
  
  factory :board do 
    name 'Ocean Rodeo Mako'
  end
end