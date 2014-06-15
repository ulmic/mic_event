class Event < ActiveRecord::Base
  attr_accessible :description,
                  :begin_datetime,
                  :end_datetime,
                  :member_id,
                  :place_id,
                  :title,
                  :program_id,
                  :photo

  mount_uploader :photo, PhotoUploader

  belongs_to :member
  belongs_to :place
  belongs_to :program
  has_many :checkins

  validates :description, presence: true
  validates :place_id, presence: true
  validates :title, presence: true
  validates :member_id, presence: true
  validates :begin_datetime, presence: true
  validates :end_datetime, presence: true, date: { after: :begin_datetime }
  validates :program_id, presence: true
  validates :photo, presence: true
end
