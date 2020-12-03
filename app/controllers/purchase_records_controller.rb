class PurchaseRecordsController < ApplicationController
  before_action :set_user
  before_actio :set_item

  def index
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path unless @item.purchase_record.nil?
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_record).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def set_user
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
