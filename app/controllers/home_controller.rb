class HomeController < ApplicationController
	before_filter :authenticate_sitter!, :only => [:hostadmin]
	def index

	end

	def hostadmin

		if params[:res_status] == 'Accepted'
			Reservation.find(params[:reservation_id]).update_attributes(:res_status => "Accepted")
		elsif params[:res_status] == 'Denied'
			Reservation.find(params[:reservation_id]).update_attributes(:res_status => "Denied")
		end
		@user = current_sitter
		@reservation_requests = current_sitter.reservations.where(res_status: 'Proposed')
		@reservations = current_sitter.reservations

		@month = (params[:month] || (Time.zone || Time).now.month).to_i
   		@year = (params[:year] || (Time.zone || Time).now.year).to_i

    	@shown_month = Date.civil(@year, @month)
		@event_strips = current_sitter.reservations.where(:res_status => ['Accepted', 'Proposed']).event_strips_for_month(@shown_month)
	end


	def approve_reservation(res_id)
		request = current_sitter.reservations.find(res_id)
		request.res_status = 'Approved'
	end

	def deny_reservation(res_id)
		request = current_sitter.reservations.find(res_id)
		request.res_status = 'Denied'
	end
end
