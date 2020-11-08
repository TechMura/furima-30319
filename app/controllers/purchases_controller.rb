class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
    end
  end

  private

  def purchase_params
    item_id = params[:item_id]
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  end

end
