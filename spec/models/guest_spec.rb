require 'rails_helper'

RSpec.describe Guest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
   describe 'validations' do
     it 'is valid with valid attributes' do
      guest = Guest.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john.doe@example.com',
        phone: '1234567890'
      )
      expect(guest).to be_valid
    end

    it 'is not valid without a first name' do
      guest = Guest.new(
        last_name: 'Doe',
        email: 'john.doe@example.com',
        phone: '1234567890'
      )
      expect(guest).not_to be_valid
      expect(guest.errors[:first_name]).to include("can't be blank")
    end
   end
   describe 'associations' do
    it 'has many reservations' do
      guest = Guest.reflect_on_association(:reservations)
      expect(guest.macro).to eq(:has_many)
    end

    # Add more association tests as needed
  end
  describe 'create' do
    it 'creates a new guest' do
     
      guest = Guest.create(
          first_name: 'Jane',
          last_name: 'Smith',
          email: 'jane.smith@example.com',
          phone: '9876543210'
        )
      expect(Guest.count).to eq(1)
      expect(guest.first_name).to eq('Jane')
      expect(guest.last_name).to eq('Smith')
      expect(guest.email).to eq('jane.smith@example.com')
      expect(guest.phone).to eq('9876543210')
      
    end
  end
end
