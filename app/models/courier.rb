class Courier < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :weight, :status, :service_type, :payment_mode, :cost, presence: true

  validates :order_number, presence: true, uniqueness: true
end
