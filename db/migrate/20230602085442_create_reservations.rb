class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :reservation_code
      t.string :string
      t.string :start_date
      t.string :datetime
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
      t.string :integer

      t.timestamps
    end
  end
end
