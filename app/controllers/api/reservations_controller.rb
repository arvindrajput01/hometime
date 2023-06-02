class Api::ReservationsController < ApplicationController
  def create
    if request.put? || request.post?
      if params[:reservation][:reservation_code].present?
        handle_one_reservation_payload
      elsif params[:reservation][:code].present?
        handle_other_reservations_payload
      else
        render json: { error: 'Invalid payload format' }, status: :unprocessable_entity
      end
    else
      head :method_not_allowed
    end
  rescue ActiveRecord::RecordInvalid => e
    handle_validation_error(e)
  rescue StandardError => e
    handle_error(e)
  end

private

  def handle_one_reservation_payload
    reservation_data = params.require(:reservation).permit(:reservation_code, :start_date, :end_date, :nights, :guests, :adults, :children, :infants, :status, :currency, :payout_price, :security_price, :total_price)
    guest_data = params.require(:guest).permit(:first_name, :last_name, :phone, :email)

    @reservation = Reservation.find_or_initialize_by(reservation_code: reservation_data[:reservation_code])
    @reservation.assign_attributes(reservation_data)

    create_or_update_reservation(guest_data)
  end

  def handle_other_reservations_payload
	 reservation_data = params.require(:reservation).permit(:code, :start_date, :end_date, :expected_payout_amount, :guest_email, :guest_first_name, :guest_last_name, :listing_security_price_accurate, :host_currency, :nights, :number_of_guests, :status_type, :total_paid_amount_accurate)

	  guest_data = {
	    email: params[:reservation][:guest_email],
	    first_name: params[:reservation][:guest_first_name],
	    last_name: params[:reservation][:guest_last_name],
	    phone: params[:reservation][:guest_phone_numbers]
	  }
	  @reservation = Reservation.find_or_initialize_by(reservation_code: reservation_data[:code])
	  @reservation.attributes = {
	    reservation_code: reservation_data[:code],
	    start_date: reservation_data[:start_date],
	    end_date: reservation_data[:end_date],
	    payout_price: reservation_data[:expected_payout_amount],
	    security_price: reservation_data[:listing_security_price_accurate],
	    currency: reservation_data[:host_currency],
	    nights: reservation_data[:nights],
	    guests: reservation_data[:number_of_guests],
	    status: reservation_data[:status_type],
	    total_price: reservation_data[:total_paid_amount_accurate]
	  }

	  create_or_update_reservation(guest_data)
  end

 def create_or_update_reservation(guest_params)
    create_guest(guest_params)
    @reservation.guest = @guest

    Reservation.transaction do
      @reservation.save!
    end
    render json: @reservation, include: :guest, status: :ok	
  end

  def create_guest(guest_params)
    @guest = Guest.find_or_initialize_by(email: guest_params[:email]) 
    @guest.attributes =guest_params
    Guest.transaction do
    	@guest.save!
    end
  end


  def handle_validation_error(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_error(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end
end