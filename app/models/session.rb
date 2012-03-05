class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  belongs_to :kite
  belongs_to :location
  
  validates :date, presence: true
  
  accepts_nested_attributes_for :board,    :reject_if => :reject_board
  accepts_nested_attributes_for :kite,     :reject_if => :reject_kite
  accepts_nested_attributes_for :location, :reject_if => :reject_location
  
  
  before_save :sanitize_nested_attributes
  
  # If we are given both a kite_id and kite_attributes, we choose the kite_id
  def reject_nested_belongs_to(nested_attributes, foreign_key)
    nested_attributes[:name].blank? || ! self.read_attribute(foreign_key).blank?
  end
  
  def reject_board(board_attributes)
    reject_nested_belongs_to(board_attributes, :board_id)
  end
  
  def reject_kite(kite_attributes)
    reject_nested_belongs_to(kite_attributes, :kite_id)
  end
  
  def reject_location(location_attributes)
    reject_nested_belongs_to(location_attributes, :location_id)
  end

  
  def sanitize_nested_attributes
    self.board.update_attribute(:user_id, self.user.id) if self.board && self.board.user.blank?
    self.kite.update_attribute(:user_id, self.user.id) if self.kite && self.kite.user.blank?
    self.location.update_attribute(:user_id, self.user.id) if self.location && self.location.user.blank?
  end
end
