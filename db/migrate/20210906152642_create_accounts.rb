class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :bank_name
      t.references :contributors, foreign_key: true, index: true
      t.timestamps
    end
  end
end
