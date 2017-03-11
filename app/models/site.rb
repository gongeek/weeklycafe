class Site < ApplicationRecord
  has_many :item, dependent: :delete
  has_many :user_site, dependent: :delete
  has_many :user, through: :user_site
end