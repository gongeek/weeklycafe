class Site < ApplicationRecord
  has_many :item, dependent: :destroy
  has_many :user_site, dependent: :destroy
  has_many :user, through: :user_site
end