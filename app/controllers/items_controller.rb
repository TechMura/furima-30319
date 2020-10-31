class ItemsController < ApplicationController

  def index
  end

  def new
    
  end

  def create
    binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:status_id,:delivery_payment_id,:prefecture_id,:shipping_period_id,:price).merge(user_id: current_user.id)
  end
end
