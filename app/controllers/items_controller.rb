class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
    
  end

  def new
    @items_tag = ItemsTag.new
  end

  def create
    @items_tag = ItemsTag.new(item_params)
    if @items_tag.valid?
      @items_tag.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @user = User.find_by(id: @item[:user_id]) 

    @message = Message.new
    @messages = Message.all

    @tag = @item.tags[0]

  end

  def edit
    
  end  

  def update
    if @item.update(item_update_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
      if @items_tag.destroy
        redirect_to root_path
      else
        render :show
      end
  end  

  def search
    @items = Item.search(params[:keyword])
    binding.pry
  end


  
  private

  def item_params
    params.require(:items_tag).permit(:tag_name, :image, :name, :comments, :price, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id).merge(user_id: current_user.id)
  end

  def item_update_params
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
