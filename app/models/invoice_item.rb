class InvoiceItem < ActiveRecord::Base
  before_save :convert_unit_price

  belongs_to :invoice
  belongs_to :item

  private

    def convert_unit_price
      unit_price.to_f / 100
    end
end
