class AddSiteTable < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :url
      t.string :name
      t.string :rss
      t.integer :version_id
      t.string :type
    end
  end
end
