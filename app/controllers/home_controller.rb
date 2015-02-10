class HomeController < ApplicationController
	def index

	end

	def hostadmin
		@user = current_sitter
		@reservation_requests = current_sitter.reservations.where(res_status: 'Proposed')
		@reservations = current_sitter.reservations

		@month = (params[:month] || (Time.zone || Time).now.month).to_i
   		@year = (params[:year] || (Time.zone || Time).now.year).to_i

    	@shown_month = Date.civil(@year, @month)
		@event_strips = current_sitter.reservations.event_strips_for_month(@shown_month)
	end
end
