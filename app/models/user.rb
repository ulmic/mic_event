class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_one :member

  validates :email, presence: true,
                    email: true,
                    uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 16 }
end
