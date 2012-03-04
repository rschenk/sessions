class CreateKites < ActiveRecord::Migration
  def change
    create_table :kites do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :kites, :user_id
  end
end
