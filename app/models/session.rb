class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  belongs_to :kite
  
  validates :date, presence: true
  
  accepts_nested_attributes_for :board, :reject_if => :reject_board
  accepts_nested_attributes_for :kite,  :reject_if => :reject_kite
  
  
  before_save :sanitize_nested_attributes
  
  # If we are given both a board_id and board_attributes, we choose the board_id
  def reject_board(board_attributes)
    board_attributes[:name].blank? || !self.read_attribute(:board_id).blank?
  end
  
  # If we are given both a kite_id and kite_attributes, we choose the kite_id
  def reject_kite(kite_attributes)
    kite_attributes[:name].blank? || !self.read_attribute(:kite_id).blank?
  end
  
  def sanitize_nested_attributes
    self.board.update_attribute(:user_id, self.user.id) if self.board && self.board.user.blank?
    self.kite.update_attribute(:user_id, self.user.id) if self.kite && self.kite.user.blank?
  end
end
