class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
    @user = User.find_by(id: @item[:user_id]) 
  end

  def edit
  
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
  end  

#end

  
  private

  def item_params
    params.require(:item).permit(:image, :name, :comments, :price, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  

  def move_to_index
    if current_user != @item.user || @item.user_item != nil 
       redirect_to root_path 
    end
  end

  
end
