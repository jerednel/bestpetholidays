module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  # custom options for this calendar
  def event_calendar_opts
    {
      :year => @year,
      :event_height => 22,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/reservations/#{event.id}" title="#{h(event.res_details)}">#{h(event.res_details)}</a>)
    end
  end
end

#%(<a href="/reservations/#{event.id}" title="#{h(event.res_details)}">#{h(event.res_details)}</a>)
