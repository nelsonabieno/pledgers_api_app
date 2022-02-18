class AddParishAreaZoneToContributors < ActiveRecord::Migration[5.2]
  def change
    add_column :contributors, :parish_id, :integer
    add_column :contributors, :area_id, :integer
    add_column :contributors, :zone_id, :integer
  end
end
