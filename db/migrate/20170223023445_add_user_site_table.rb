class AddUserSiteTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_sites do |t|
      t.belongs_to :user
      t.belongs_to :site
    end
  end
end
