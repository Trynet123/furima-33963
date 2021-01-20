class ItemTransactionsController < ApplicationController
  def index
    @item_transaction = ItemTransaction.new
  end

  def create
  end
end
