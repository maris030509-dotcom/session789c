class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :groupusers
  has_many :users, through: :groupusers

  has_one_attached :image
end
