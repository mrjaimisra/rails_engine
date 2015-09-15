class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :status
    end
  end
end
