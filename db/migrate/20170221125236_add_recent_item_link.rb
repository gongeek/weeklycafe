class AddRecentItemLink < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :recent_item_link, :string
    add_column :items, :site_id, :integer
  end
end
