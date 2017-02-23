class AddAccessNumToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :access_num, :integer
  end
end
