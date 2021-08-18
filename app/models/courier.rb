class Courier < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  before_validation :save_details, :if => Proc.new {|model| model.new_record? }

  validates :weight, :status, :service_type, :payment_mode, :cost, presence: true

  validates :order_number, presence: true, uniqueness: true

  def save_details
    self.order_number = "ORDER-#{SecureRandom.hex(6)}"
    self.status = 'Sent'
    self.address = self.receiver.address
  end
end
