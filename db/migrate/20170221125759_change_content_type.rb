class ChangeContentType < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :content, :text
  end
end
