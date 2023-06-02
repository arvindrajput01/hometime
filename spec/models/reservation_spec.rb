require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it 'is valid with valid attributes' do
      guest = Guest.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john.doe@example.com',
        phone: '1234567890'
      )
      reservation = Reservation.new(
        reservation_code: 'ABC123',
        start_date: Date.today,
        end_date: Date.today + 5,
        nights: 2,
        guests: 4,
        adults: 3,
        children: 1,
        infants: 0,
        status: "Accepted",
        currency: "aud",
        payout_price: 1000.20,
        security_price: 200.10,
        total_price: 1200.30,
        localized_description: "4 guests",
        guest: guest

      )
      
      expect(reservation).to be_valid
      expect(reservation.guest).to eq(guest)
    end
    it 'is not valid without a reservation code' do
      reservation = Reservation.new(reservation_code: nil)
      expect(reservation).not_to be_valid
    end
  end
end
