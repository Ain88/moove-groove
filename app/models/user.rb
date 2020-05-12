class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :records, :dependent => :destroy
         has_many :activities, through: :records
  validates :email, length: { maximum: 30, :message => "address is too long" }
  validates :first_name, presence: true, length: { maximum: 20, :message => "is too short or long" }
  validates :last_name, presence: true, length: { maximum: 20, :message => "is too short or long" }
  validates :weight, presence: true, length: { minimum: 1, maximum: 3, :message => "Must be between 0-999(kg)" }
end
