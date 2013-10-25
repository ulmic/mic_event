class Member < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :middle_name,
                  :number,
                  :email,
                  :password,
                  :photo,
                  :motto,
                  :post

  mount_uploader :photo, PhotoUploader

  has_many :checkins, dependent: :destroy
  has_many :children, class_name: "Member",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "Member"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :number, presence: true,
                     uniqueness: true
  validates :email, presence: true,
                    email: true,
                    uniqueness: true
  validates :password, presence: true
  validates :motto, presence: true, length: { maximum: 140 }
end
