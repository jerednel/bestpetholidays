class SittersController < ApplicationController
	def show
		@sitter = Sitter.find(params[:id])
		@reservation = Reservation.new
     end
end
