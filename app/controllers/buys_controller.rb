class BuysController < ApplicationController
  before_action :set_buy, only: [:index, :create]
  before_action :sort

  def index
    @item_buy = ItemBuy.new
  end

  def create
    @item_buy = ItemBuy.new(buy_params)
    if @item_buy.valid?
      pay_item
      @item_buy.save
      redirect_to items_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:item_buy).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def sort
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user.id != @item.user_id && @item.buy == nil
      redirect_to items_path
    end
  end
end
