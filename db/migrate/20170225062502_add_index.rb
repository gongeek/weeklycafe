class AddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :sites, :rss, :unique => true
  end
end
