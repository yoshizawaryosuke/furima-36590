class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_buy
  before_action :redirect_root

  def index
    @buy_shipping_address = BuyShippingAddress.new
  end

  def create
    @buy_shipping_address = BuyShippingAddress.new(buy_params)
    if @buy_shipping_address.valid?
      pay_item
      @buy_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_root
    redirect_to root_path if current_user == @item.user || @item.buy.present?
  end
end
