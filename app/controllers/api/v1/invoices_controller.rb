class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find
    respond_with Invoice.find_by(item_params)
  end

  def find_all
    respond_with Invoice.where(item_params)
  end

  def random
    respond_with Invoice.all.shuffle.pop
  end

  private

  def item_params
    params.permit(:id, :status, :customer_id, :merchant_id, :created_at, :updated_at)
  end
end
