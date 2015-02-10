class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :sitter
	has_event_calendar :start_at_field  => 'res_start_date', :end_at_field => 'res_end_date'

	def color
		if self.res_status == 'Accepted'
			return "#CCFF00" #any html acceptable color 
		elsif self.res_status == 'Proposed'
			return "#00FF66"
		end

	end
end
