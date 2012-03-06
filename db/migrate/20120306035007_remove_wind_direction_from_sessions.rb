class RemoveWindDirectionFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :wind_direction
  end

  def down
    add_column :sessions, :wind_direction, :integer
  end
end
