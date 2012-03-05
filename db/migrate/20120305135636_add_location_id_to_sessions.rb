class AddLocationIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :location_id, :integer
    add_index  :sessions, :location_id
  end
end
