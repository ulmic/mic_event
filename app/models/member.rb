class Member < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :middle_name,
                  :photo,
                  :motto,
                  :post,
                  :parent_id,
                  :user_id,
                  :confirm

  mount_uploader :photo, PhotoUploader

  has_many :checkins, dependent: :destroy
  has_many :children, class_name: "Member",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "Member"
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :motto, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  state_machine :confirm, initial: :new do
    state :new
    state :accepted
    state :busted

    event :accept do
      transition new: :accepted
    end

    event :bust do
      transition [ :new, :accepted] => :busted
    end
  end
end
