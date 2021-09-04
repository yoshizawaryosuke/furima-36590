class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
   
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_text, :category_id, :postage_id, :condition_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end

end
