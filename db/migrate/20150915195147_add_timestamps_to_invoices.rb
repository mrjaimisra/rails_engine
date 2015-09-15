class AddTimestampsToInvoices < ActiveRecord::Migration
  def change
    add_timestamps(:invoices)
  end
end
