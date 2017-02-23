class Site < ApplicationRecord
  has_many :item
  has_many :user_site
  has_many :user, through: :user_site
end