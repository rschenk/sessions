class Kite < ActiveRecord::Base
  belongs_to :user
  has_many :sessions
end
