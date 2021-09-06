class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount_paid
      t.string :reference
      t.references :accounts, foreign_key: true, index: true
      t.references :projects, foreign_key: true, index: true
      t.timestamps
    end
  end
end
