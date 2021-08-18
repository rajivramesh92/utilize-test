class Courier < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  before_validation :save_details, :if => Proc.new {|model| model.new_record? }

  validates :weight, :status, :service_type, :payment_mode, :cost, presence: true

  validates :order_number, presence: true, uniqueness: true
  after_create :send_mail_to_receiver

  def save_details
    self.order_number = "ORDER-#{SecureRandom.hex(6)}"
    self.status = 'Sent'
    self.address_id = self.receiver.address.id if self.receiver.address.present?
  end

  def send_mail_to_receiver
    UserMailer.send_mail_to_receiver(self.receiver, self).deliver_now
  end
end
