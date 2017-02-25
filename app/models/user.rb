class User < ApplicationRecord
  has_many :user_site
  has_many :site, through: :user_site

  def self.new_and_save user_hash
    user=User.new(user_hash)
    user.save
    UserSite.add_all_site_to_user user.id
    user
  end
end