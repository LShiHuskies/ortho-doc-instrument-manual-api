class Office < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
end
