class ItemsController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_text, :category_id, :postage_id, :condition_id, :prefeture_id, :days_id, :price).merge(user_id: current_user.id)
  end

end
