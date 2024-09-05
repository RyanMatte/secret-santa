class User < ApplicationRecord
  include Clearance::User

  has_many :gifts
  has_many :shippings
end
