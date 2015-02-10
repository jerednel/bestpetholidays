class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@reservations = Reservation.all
    if user_signed_in?
      @reservations = current_user.reservations
    elsif sitter_signed_in?
      @reservations = current_sitter.reservations
    end
    respond_with(@reservations)
  end

  def show
    respond_with(@reservation)
  end

  def new
    if user_signed_in?
      @user = current_user
    elsif sitter_signed_in?
      @user = current_sitter
    end

    @sitter = Sitter.find(params[:sitter_id])
    @reservation = Reservation.new
    start_date = params[:reservation][:res_start_date].to_date
    end_date = params[:reservation][:res_end_date].to_date
    @days = end_date - start_date
    @total_price = @days * @sitter.rate
    respond_with(@reservation)

  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    respond_with(@reservation)
  end

  def update
    @reservation.update(reservation_params)
    respond_with(@reservation)
  end

  def destroy
    @reservation.destroy
    respond_with(@reservation)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:res_status, :user_id, :sitter_id, :res_details, :res_price, :res_start_date, :res_end_date)
    end
end
