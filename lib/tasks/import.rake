require 'csv'

namespace :import do

  desc "Import customers from CSV"
  task customers: :environment do
    filename = File.join Rails.root, "/data/customers.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      customer = Customer.create(row.to_h.except("id"))

      puts "#{customer.first_name} #{customer.last_name} - #{customer.errors.full_messages.join(",")}" if customer.errors.any?
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"
  end

  desc "Import merchants from CSV"
  task merchants: :environment do
    filename = File.join Rails.root, "/data/merchants.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(row.to_h.except("id"))

      puts "#{merchant.name} - #{merchant.errors.full_messages.join(", ")}" if merchant.errors.any?
      counter += 1 if merchant.persisted?
    end

    puts "Imported #{counter} merchants"
  end

  desc "Import items from CSV"
  task items: :environment do
    filename = File.join Rails.root, "/data/items.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      item = Item.create(name: row["name"],
                         description: row["description"],
                         unit_price: (row["unit_price"].to_f / 100),
                         merchant_id: row["merchant_id"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])

      puts "#{item.name} - #{item.errors.full_messages.join(",")}" if item.errors.any?
      counter += 1 if item.persisted?
    end

    puts "Imported #{counter} items"
  end

  desc "Import invoices from CSV"
  task invoices: :environment do
    filename = File.join Rails.root, "/data/invoices.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(row.to_h.except("id"))

      puts "#{invoice.id} - #{invoice.errors.full_messages.join(",")}" if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end

    puts "Imported #{counter} invoices"
  end

  desc "Import invoice items from CSV"
  task invoice_items: :environment do
    filename = File.join Rails.root, "/data/invoice_items.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      invoice_item = InvoiceItem.create(item_id: row["item_id"],
                                        invoice_id: row["invoice_id"],
                                        quantity: row["quantity"],
                                        unit_price: (row["unit_price"].to_f / 100),
                                        created_at: row["created_at"],
                                        updated_at: row["updated_at"])

      puts "#{invoice_item.id} - #{invoice_item.errors.full_messages.join(",")}" if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
    end

    puts "Imported #{counter} invoice items"
  end

  desc "Import transactions from CSV"
  task transactions: :environment do
    filename = File.join Rails.root, "/data/transactions.csv"
     counter = 0

    CSV.foreach(filename, headers: true) do |row|
      transaction = Transaction.create(row.to_h.except("id", "credit_card_expiration_date"))

      puts "#{transaction.id} - #{transaction.errors.full_messages.join(",")}" if transaction.errors.any?
      counter += 1 if transaction.persisted?
    end

    puts "Imported #{counter} transactions"
  end
end
