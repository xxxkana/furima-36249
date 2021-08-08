class UserItemController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @user_item =AddressUserItem.new

  end  

  
  def create
    @item = Item.find(params[:item_id])
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

  def user_item_params
    params.require(:address_user_item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_50e0bd5213eacb07f04a8494"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  

end
