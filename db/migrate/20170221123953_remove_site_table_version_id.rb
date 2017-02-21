class RemoveSiteTableVersionId < ActiveRecord::Migration[5.0]
  def change
    remove_column :sites, :version_id
  end
end
