class ItemsController < ApplicationController
=begin
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(prototype_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
=end
end
