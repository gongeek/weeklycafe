class CreateItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :content
      t.string :link
    end
  end
end
