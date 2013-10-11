class Event < ActiveRecord::Base
  attr_accessible :datetime, :description, :member_id, :place_id, :title

  validates :datetime, presence: true
  validates :description, presence: true
  validates :member_id, presence: true
  validates :place_id, presence: true
  validates :title, presence: true
end
