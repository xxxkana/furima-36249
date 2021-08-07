class UserItemController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user_item =UserItem.new
  end  

  
  def create
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render :index
    end

  end  

  private

  def user_item_params
    params.require(:user_item).permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: current_user.id)
  end  
  

end
