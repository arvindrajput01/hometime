FactoryBot.define do
  factory :guest do
    first_name { 'Jane' }
    last_name { 'Smith' }
    email { 'jane.smith@example.com' }
    phone { '9876543210' }
  end
end