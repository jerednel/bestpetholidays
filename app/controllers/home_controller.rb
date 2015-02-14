class HomeController < ApplicationController
	before_filter :authenticate_sitter!, :only => [:hostadmin]
	def index

	end

	def hostadmin

		if params[:res_status] == 'Accepted'
			Reservation.find(params[:reservation_id]).update_attributes(:res_status => "Accepted")
			mail_confirmation('Accepted')
		elsif params[:res_status] == 'Denied'
			Reservation.find(params[:reservation_id]).update_attributes(:res_status => "Denied")
			mail_confirmation('Denied')
		end
		@user = current_sitter
		@reservation_requests = current_sitter.reservations.where(res_status: 'Proposed')
		@reservations = current_sitter.reservations

		@month = (params[:month] || (Time.zone || Time).now.month).to_i
   		@year = (params[:year] || (Time.zone || Time).now.year).to_i
   		time = Date.new(@year, @month).to_time
   		#@booked_revenue = current_sitter.reservations(:res_end_date => time..time.end_of_month).sum(:res_price)

   		@booked_revenue = current_sitter.reservations.where(:res_end_date => Date.new(@year, @month).to_time..Date.new(@year, @month).to_time.end_of_month).sum(:res_price)
    	@shown_month = Date.civil(@year, @month)
		@event_strips = current_sitter.reservations.where(:res_status => ['Accepted', 'Proposed']).event_strips_for_month(@shown_month)
	end

	def mail_confirmation(status)
		
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
