class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address
  has_many :received_orders, class_name: 'Courier', foreign_key: :receiver_id
  has_many :sent_orders, class_name: 'Courier', foreign_key: :user_id
  has_many :couriers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true
  accepts_nested_attributes_for :address
end