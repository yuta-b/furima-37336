class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at:"desc")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      item = Item.find(params[:id])
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_version, :category_id, :condition_id, :delivery_charge_id, :delivery_days_id, :delivery_place_id, :price, :image).merge(user_id: current_user.id)
  end

end
