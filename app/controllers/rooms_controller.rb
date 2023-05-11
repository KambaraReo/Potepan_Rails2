class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]

  def index
    @user = current_user
    @rooms = Room.where(user_id: current_user.id) # ログインユーザーの登録施設のみ取得
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path(@room)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def search
    @user = current_user
    if params[:accommodation_address].present? && params[:accommodation_name_or_detail].present?
      @rooms = Room.where("accommodation_address like ? AND (accommodation_name like ? OR accommodation_detail like ?)", "%#{params[:accommodation_address]}%", "%#{params[:accommodation_name_or_detail]}%", "%#{params[:accommodation_name_or_detail]}%")
    elsif params[:accommodation_address].present?
      @rooms = Room.where("accommodation_address like ?", "%#{params[:accommodation_address]}%")
    elsif params[:accommodation_name_or_detail].present?
      @rooms = Room.where("accommodation_name like ? OR accommodation_detail like ?", "%#{params[:accommodation_name_or_detail]}%", "%#{params[:accommodation_name_or_detail]}%")
    else
      @rooms = Room.all
    end
  end

  private

  def room_params
    params.require(:room).permit(:accommodation_name, :accommodation_detail, :accommodation_fee, :accommodation_address, :accommodation_img, :user_id)
  end

end
