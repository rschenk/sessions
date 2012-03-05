class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  belongs_to :kite
  
  validates :date, presence: true
end
