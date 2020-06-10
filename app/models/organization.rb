class Organization < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  has_many :user
end
