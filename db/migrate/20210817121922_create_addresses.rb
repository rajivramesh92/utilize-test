class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :full_address
      t.string :pin_code
      t.string :phone_number
      t.references :user

      t.timestamps
    end
  end
end
