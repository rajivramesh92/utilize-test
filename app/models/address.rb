class Address < ApplicationRecord
  belongs_to :user
  has_many :couriers
  validates :full_address, :pin_code, :phone_number, presence: true
  validates_length_of :phone_number, minimum: 10, maximum: 10
  validates :phone_number, :numericality => true
end