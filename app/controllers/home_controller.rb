class HomeController < ApplicationController
	def index

	end

	def hostadmin
		@user = current_sitter
		@reservation_requests = current_sitter.reservations.where(res_status: 'Proposed')
		@reservations = current_sitter.reservations
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
	end
end
