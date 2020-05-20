class Activity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :calories, presence: true, length: { minimum: 1, maximum: 10 }
  validates :description, presence: true, length: { minimum: 2, maximum: 500 }
  
  has_many :records, :dependent => :destroy
  has_many :users, through: :records
end
