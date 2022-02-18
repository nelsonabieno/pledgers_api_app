class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.references :zones, foreign_key: true, index: true
    end
  end
end
