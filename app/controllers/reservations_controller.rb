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
    if user_signed_in?
      #respond_with(@reservation)
      current_user.reservations.find_by_id(params[:id])
    elsif sitter_signed_in?
      current_sitter.reservations.find_by_id(params[:id])
      #respond_with(@reservation)
    else
      redirect_to :root
    end
  end

  def new
    if user_signed_in?
      @user = current_user
    elsif sitter_signed_in?
      @user = current_sitter
    end
    if user_signed_in?
        if params[:reservation][:res_start_date] == ""  || params[:reservation][:res_end_date] == ""
          redirect_to(:back)
          flash[:alert] = "Please enter valid check-in and check-out dates."
        else
          @sitter = Sitter.friendly.find(params[:sitter_id])
          @reservation = Reservation.new
          start_date = params[:reservation][:res_start_date].to_date
          end_date = params[:reservation][:res_end_date].to_date
          @days = end_date - start_date
          @total_price = @days * @sitter.rate
          respond_with(@reservation)
        end

    elsif sitter_signed_in?
      @sitter = current_sitter
      @reservation = Reservation.new

    end
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
      params.permit(:res_status)
      params.require(:reservation).permit(:res_status, :user_id, :sitter_id, :res_details, :res_price, :res_start_date, :res_end_date)
    end
end
