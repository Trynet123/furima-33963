class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.valid?
      item.update
      redirect_to item_path
    else
      render edit_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :prefecture_id, :category_id, :condition_id, :shipping_charge_id, :presence, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
