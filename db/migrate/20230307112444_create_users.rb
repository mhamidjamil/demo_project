class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email 
      t.integer :role, default: 0 # 0: developer, 1: qa, 2: manager
      t.string :password_digest
      t.timestamps
    end
  end
end
