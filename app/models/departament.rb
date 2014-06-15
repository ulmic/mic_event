class Departament < ActiveRecord::Base
  attr_accessible :description,
                  :district,
                  :lider_id,
                  :title

  belongs_to :lider, class_name: "Member"
  has_many :members
end
