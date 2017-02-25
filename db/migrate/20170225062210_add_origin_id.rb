class AddOriginId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :origin_id, :integer
  end
end
