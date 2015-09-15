class AddTimestampsToInvoiceItems < ActiveRecord::Migration
  def change
    add_timestamps(:invoice_items)
  end
end
