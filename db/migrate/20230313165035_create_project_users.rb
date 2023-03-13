class CreateProjectUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_users do |t|
      t.integer :user_id, :null => false
      t.integer :project_id, :null => false
      t.timestamps
    end
  end
end
