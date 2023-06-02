require 'rails_helper'

RSpec.describe "Api::Reservations", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe 'POST create' do
       it 'creates a new reservation' do
        # Prepare test data and make a request
      post api_reservations_path, params: {
          reservation: {
            reservation_code: 'YYY12345678',
            start_date: '2021-04-14',
            end_date: '2021-04-18',
            nights: 4,
            guests: 5,
            adults: 2,
            children: 2,
            infants: 0,
            status: 'accepted',
            currency: 'AUD',
            payout_price: '4200.00',
            security_price: '500',
            total_price: '4700.00'
          },
          guest: {
            first_name: 'Wayne',
            last_name: 'Woodbridge',
            phone: '639123456789',
            email: 'wayne_woodbridge@bnb.com'
          }
      }
      #Add your assertions here
        expect(response).to have_http_status(:ok)
    end

      it 'handles the other reservations payload' do
        # Prepare test data and make a request
        post api_reservations_path, params: {
           reservation: {
            code: 'XXX12345678',
            start_date: '2021-03-12',
            end_date: '2021-03-16',
            expected_payout_amount: '3800.00',
            guest_email: 'wayne_woodbridge@bnb.com',
            guest_first_name: 'Wayne',
            guest_last_name: 'Woodbridge',
            listing_security_price_accurate: '500.00',
            host_currency: 'AUD',
            nights: 4,
            number_of_guests: 4,
            status_type: 'accepted',
            total_paid_amount_accurate: '4300.00'
          }
        }

        # Add your assertions here
        expect(response).to have_http_status(:ok)
        # ...
    end
  end
end
