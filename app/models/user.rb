class User < ApplicationRecord
  include Clearance::User

  has_many :gifts 
end
