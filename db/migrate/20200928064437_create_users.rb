class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :login, null: false
      t.string :password, null: false, default: ""
      t.text :token, null: false
      t.references :tenant, foreign_key: true

      t.timestamps
    end
    add_index :users, :login
    add_index :users, :token
  end
end
