json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :res_status, :user_id, :sitter_id, :res_details, :res_price, :res_start_date, :res_end_date
  json.url reservation_url(reservation, format: :json)
end
