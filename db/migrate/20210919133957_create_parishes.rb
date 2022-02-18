class CreateParishes < ActiveRecord::Migration[5.2]
  def change
    create_table :parishes do |t|
      t.string :name
      t.references :areas, foreign_key: true, index: true
    end
  end
end
