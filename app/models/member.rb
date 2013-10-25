class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :number, :email, :password, :photo

  mount_uploader :photo, PhotoUploader

  has_many :checkins, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :number, presence: true
  validates :email, presence: true,
                    email: true
  validates :password, presence: true
end
