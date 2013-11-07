class Admin < ActiveRecord::Base
  attr_accessible :member_id

  belongs_to :member

  validates :member_id, presence: :true
end
