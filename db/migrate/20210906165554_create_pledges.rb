class CreatePledges < ActiveRecord::Migration[5.2]
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.references :contributors, foreign_key: true, index: true
      t.references :projects, foreign_key: true, index: true
      t.timestamps
    end
  end
end
