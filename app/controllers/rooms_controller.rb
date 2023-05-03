class RoomsController < ApplicationController
  def index
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
    @room = Room.find(params[:id])
  end

  def edit
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

  private

  def room_params
    params.require(:room).permit(:accommodation_name, :accommodation_detail, :accommodation_fee, :accommodation_address, :accommodation_img, :user_id)
  end

end
