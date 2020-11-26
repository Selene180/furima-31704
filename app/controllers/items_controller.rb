class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end