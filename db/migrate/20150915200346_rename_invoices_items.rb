class RenameInvoicesItems < ActiveRecord::Migration
  def change
    rename_table :invoices_items, :invoice_items
  end
end
