class Checkin < ActiveRecord::Base
  extend Enumerize

  attr_accessible :description,
                  :member_id,
                  :event_id,
                  :status

  enumerize :status, in: [:organizer,
                          :participant],
                          default: :organizer

  belongs_to :member
  belongs_to :event

  validates :member_id, presence: true
  validates :event_id, presence: true
  validates :status, presence: true
end
