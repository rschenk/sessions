class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  belongs_to :kite
  
  validates :date, presence: true
  
  accepts_nested_attributes_for :board, :reject_if => :reject_boards
  
  before_save :sanitize_new_nested_board
  
  # If we are given both a board_id and board_attributes, we choose the board_id
  def reject_boards(board_attributes)
    !self.read_attribute(:board_id).blank?
  end
  
  def sanitize_new_nested_board
    self.board.update_attribute(:user_id, self.user.id) if self.board.user.blank?
  end
end
