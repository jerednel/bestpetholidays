class HomeController < ApplicationController
	def index

	end

	def hostadmin
		@user = current_sitter

	end
end
