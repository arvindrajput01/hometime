class Api::ReservationsController < ApplicationController

	def create
		begin
		    reservation_code = params[:reservation][:reservation_code]
		    @reservation = Reservation.find_or_initialize_by(reservation_code: reservation_code)

		    if @reservation.nil?
		      @reservation = Reservation.new(reservation_params)
		    else
		      @reservation.assign_attributes(reservation_params)
		    end
			if request.put? || request.post?
				create_guest
				@reservation.guest = @guest
				@reservation.assign_attributes(reservation_params)
				Reservation.transaction do				
					@reservation.save!
				end
	      		# Logic for handling PUT and POST requests
		    else
		      head :method_not_allowed
		    end       
	  		render json: @reservation, include: :guest, status: :ok	
	  	rescue ActiveRecord::RecordInvalid => e
    		handle_validation_error(e)
	  	rescue StandardError => e
	  		handle_error(e)
	  	end
	end

	private

	def reservation_params
	  params.require(:reservation).permit(:reservation_code, :start_date, :end_date, :nights, :guests, :adults, :children, :infants, :status, :currency, :payout_price, :security_price, :total_price)
	end

	def guest_params
	  params.require(:guest).permit(:first_name, :last_name, :phone, :email)
	end

	def create_guest
	    # Find or create guest
	    @guest = Guest.find_or_create_by(email: guest_params[:email]) do |guest|
	      guest.assign_attributes(guest_params)
	    end
  	end


	def handle_validation_error(exception)
	  # Handle the validation error here
	  render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
	end

	def handle_error(exception)
	  # Handle the error here
	  render json: { error: exception.message }, status: :unprocessable_entity
	end
end
