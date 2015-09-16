class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def items
    merchant = Merchant.find_by(id: params[:id])
    respond_with merchant.items
  end

  def invoices
    merchant = Merchant.find_by(id: params[:id])
    respond_with merchant.invoices
  end

end
