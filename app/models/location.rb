class Location < ActiveRecord::Base
  belongs_to :user
  has_many :sessions
  
  validates :name, presence: true
end
