class UserItemController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  before_action :set_find, only: [:index, :create] 

  def index
    @user_item =AddressUserItem.new

  end  

  

  
  def create
    @user_item = AddressUserItem.new(user_item_params)
    if @user_item.valid?
      pay_item
      @user_item.save
     
      redirect_to root_path
    else
      render :index
    end

  end  

  private

  def set_find
    @item = Item.find(params[:item_id])
  end  

  def user_item_params
    params.require(:address_user_item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_item_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.user_item != nil
      redirect_to root_path
    end
  end
  

end
