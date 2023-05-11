class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @reservations = @user.reservations
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @user = current_user
    render "rooms/show" if @reservation.invalid?
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      render "rooms/show"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @user = current_user
  end

  def edit_confirm
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    @room = Room.find(@reservation.room_id)
    @user = current_user
    render "edit" if @reservation.invalid?
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :number_of_guests, :number_of_nights, :payment, :room_id, :user_id)
  end

end
