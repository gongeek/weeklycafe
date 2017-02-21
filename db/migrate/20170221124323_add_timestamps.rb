class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:sites, null: true)
    add_timestamps(:items, null: true)
  end
end
