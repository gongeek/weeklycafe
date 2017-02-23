class User < ApplicationRecord
  has_many :user_site
  has_many :site, through: :user_site
end