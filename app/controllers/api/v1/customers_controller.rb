class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    respond_with Customer.all.shuffle.pop
  end

  def invoices
    customer = Customer.find_by(id: params[:id])
    respond_with customer.invoices
  end

  def transactions
    customer = Customer.find_by(id: params[:id])

    respond_with customer.transactions
  end

  private

    def customer_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
