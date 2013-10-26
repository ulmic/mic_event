class Place < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :events

  validates :title, presence: true
  validates :description, presence: true
end
