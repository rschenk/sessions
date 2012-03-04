class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :boards
  belongs_to :kites
  
  validates :date, presence: true
end
