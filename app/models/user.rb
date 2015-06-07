class User < ActiveRecord::Base
  has_many :social_profiles, dependent: :destroy

  has_many :images, dependent: :destroy
  has_many :links, dependent: :destroy
end
