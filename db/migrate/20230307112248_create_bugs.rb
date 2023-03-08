class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.integer :btype , default: 1  # true: bug, false: feature
      t.string :image
      t.integer :status, default: 0 # 0: new, 1: started, 2: resolved (for bug)/completed (for feature)
      t.timestamps
      end
  end
end
