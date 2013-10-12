class Event < ActiveRecord::Base
  attr_accessible :description,
                  :event_time,
                  :member_id,
                  :place_id,
                  :title

  belongs_to :member
  belongs_to :place
  has_many :checkins

  validates :description, presence: true
  validates :place_id, presence: true
  validates :title, presence: true
  validates :member_id, presence: true
end
