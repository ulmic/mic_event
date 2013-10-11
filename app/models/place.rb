class Place < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :checkins, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
