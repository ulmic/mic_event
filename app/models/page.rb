class Page < ActiveRecord::Base
  attr_accessible :author_id,
                  :body,
                  :publish,
                  :slug,
                  :title

  belongs_to :author, class_name: "Member"

  validates :author_id, presence: true
  validates :body, presence: true
  validates :publish, presence: true
  validates :slug, presence: true, uniqueness: :true
  validates :title, presence: true
end
