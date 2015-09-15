class CreateJoinTableInvoiceItems < ActiveRecord::Migration
  def change
    create_join_table :invoices, :items do |t|
      t.index [:invoice_id, :item_id]
      t.index [:item_id, :invoice_id]
      t.integer :quantity
      t.integer :unit_price
    end
  end
end
