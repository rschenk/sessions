class AddKiteIdAndBoardIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :kite_id, :integer
    add_column :sessions, :board_id, :integer
    
    add_index :sessions, :kite_id
    add_index :sessions, :board_id
  end
end
