class Record < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  
  validates :activity_id, presence: true
  validates :activity_date, presence: true
  validates :duration, presence: true
end
