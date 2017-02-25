class UserSite < ApplicationRecord
  belongs_to :site
  belongs_to :user

  def self.add_all_site_to_user user_id
    Site.all.each do |site|
      user_item=UserSite.new(:site_id => site.id, :user_id => user_id)
      user_item.save
    end
  end


end