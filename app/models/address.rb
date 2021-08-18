class Address < ApplicationRecord
  belongs_to :user
  has_many :couriers
  validates :full_address, :pin_code, :phone_number, presence: true
end