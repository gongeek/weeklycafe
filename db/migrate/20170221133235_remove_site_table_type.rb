class RemoveSiteTableType < ActiveRecord::Migration[5.0]
  def change
    remove_column :sites, :type
  end
end
