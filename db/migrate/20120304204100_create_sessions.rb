class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :date
      t.integer :wind_speed
      t.integer :wind_direction
      t.text :comments
      t.references :user

      t.timestamps
    end
    add_index :sessions, :user_id
  end
end
