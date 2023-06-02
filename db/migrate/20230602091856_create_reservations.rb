class CreateReservations < ActiveRecord::Migration[7.0]
  def up
    create_table :reservations do |t|
      t.string :reservation_code, :unique => true, :required => true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nights
      t.integer :guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :status
      t.string :currency
      t.decimal :payout_price
      t.decimal :security_price
      t.decimal :total_price
      t.string :localized_description
      t.string :guest_id

      t.timestamps
    end
  end

  def down
    drop_table :reservations
  end
end
