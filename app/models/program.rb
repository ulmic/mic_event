class Program < ActiveRecord::Base
  attr_accessible :description,
                  :lider_id,
                  :name,
                  :logo

  mount_uploader :logo, PhotoUploader

  belongs_to :lider, class_name: "Member"

  has_many :events

  validates :description, presence: true
  validates :name, presence: true
  validates :logo, presence: true
end
