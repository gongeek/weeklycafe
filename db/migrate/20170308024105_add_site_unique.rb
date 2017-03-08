class AddSiteUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :sites, :url, :unique => true
  end
end
