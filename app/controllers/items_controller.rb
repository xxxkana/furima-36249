class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  
  def index
    @items = Item.order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item[:user_id]) 
  end

  def edit
    @item= Item.find(params[:id])
  
  end  

  def update
    @item= Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end

  end  

  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comments, :price, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item= Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end
  
end
