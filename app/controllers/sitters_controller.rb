class SittersController < ApplicationController
	#before_action :set_location, only: [:show, :edit, :update, :destroy]
	def show
		#@sitter = Sitter.find(params[:id])
		@sitter = Sitter.friendly.find(params[:id])
		@reservation = Reservation.new

		query = @sitter.latitude.to_s + "," + @sitter.longitude.to_s 
		result = Geocoder.search(query).first 
		@city = result.city
		#@sitter_city = @sitter.id #Geocoder.search(@sitter.to_param.latitude.to_s + ", ", @sitter.to_param.longitude.to_s).first.city
     end
end
