class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :account_number
      t.string :bank_name
      t.timestamps
    end
  end
end
