FactoryBot.define do
  factory :reservation do
      reservation_code {'ABC123'} 
        start_date {Date.today}
        end_date {Date.today + 5}
        nights {2}
        guests {4}
        adults {3}
        children {1}
        infants {0}
        status {"Accepted"}
        currency {"AUD"}
        payout_price {1000.20}
        security_price {200.10}
        total_price {1200.30}
        localized_description {"4 guests"}
        guest_id {1}
  end
end