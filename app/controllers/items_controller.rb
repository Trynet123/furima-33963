class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :prefecture_id, :category_id, :condition_id, :shipping_charge_id, :presence, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user.id || @item.item_transaction != nil
      redirect_to root_path 
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
