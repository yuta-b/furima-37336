class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

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

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
    if @item.present?
      redirect_to root_path
    end

  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_version, :category_id, :condition_id, :delivery_charge_id, :delivery_days_id, :delivery_place_id, :price, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    #redirect_to root_path unless current_user.id == @item.user.id
  end

end
