class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :boards, :user_id
  end
end
