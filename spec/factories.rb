FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # confirmed_at Time.now # required if the Devise Confirmable module is used
  end
  
  factory :board do 
    name 'DC Thug'
  end
  
  factory :kite do 
    name 'Wainman Boss 12m'
  end
  
end