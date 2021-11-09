class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :role
  end
end
