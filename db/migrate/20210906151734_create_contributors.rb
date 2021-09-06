class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end