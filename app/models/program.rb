class Program < ActiveRecord::Base
  attr_accessible :description, :lider_id, :name

  belongs_to :lider, class_name: "Member"

  has_many :events

  validates :description, presence: true
  validates :name, presence: true
end
