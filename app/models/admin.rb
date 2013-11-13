class Admin < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user

  validates :user_id, presence: :true
end
