class BuysController < ApplicationController
  def index
    @buy_shipping_address = BuyShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_shipping_address= BuyShippingAddress.new(buy_params)
    @buy_shipping_address.save
  end

  private

  def buy_params
    params.require(:buy_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end