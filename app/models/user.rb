class User < ActiveRecord::Base
  attr_accessible :email, :password, :confirm_state

  has_one :member
  has_one :admin

  validates :email, presence: true,
                    email: true,
                    uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 16 }

  state_machine :confirm_state, initial: :new do
    state :new
    state :accepted
    state :busted

    event :accept do
      transition new: :accepted
    end

    event :bust do
      transition [ :new, :accepted ] => :busted
    end

    event :return do
      transition bust: :accepted
    end
  end
end
