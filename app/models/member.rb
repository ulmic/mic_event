class Member < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :middle_name,
                  :photo,
                  :motto,
                  :post,
                  :parent_id,
                  :user_id,
                  :confirm,
                  :departament_id,
                  :birthdate,
                  :home_adress,
                  :phone,
                  :mail_index

  mount_uploader :photo, PhotoUploader

  has_many :checkins, dependent: :destroy
  has_many :children, class_name: "Member",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "Member"
  belongs_to :user
  belongs_to :departament

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :motto, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :birthdate, presence: true
  validates :departament_id, presence: true
  validates :home_adress, presence: true
  validates :phone, presence: true
  validates :mail_index, presence: true, length: { maximum: 6 }
end
