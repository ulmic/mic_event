class Checkin < ActiveRecord::Base
  extend Enumerize

  attr_accessible :description,
                  :member_id,
                  :place_id,
                  :status

  enumerize :status, in: [:organizer,
                          :participant],
                          default: :organizer

  belongs_to :member
  belongs_to :place

  validates :member_id, presence: true
  validates :place_id, presence: true
  validates :status, presence: true
end
