class CreateCouriers < ActiveRecord::Migration[6.1]
  def change
    create_table :couriers do |t|
      t.string :order_number
      t.float :weight
      t.string :status
      t.string :service_type
      t.string :payment_mode
      t.float :cost
      t.references :user
      t.integer :address_id, index: true
      t.integer :receiver_id, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
