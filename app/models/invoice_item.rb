class InvoiceItem < ActiveRecord::Base
  before_save :convert_unit_price

  belongs_to :item
  belongs_to :invoice

  private

    def convert_unit_price
      unit_price.to_f / 100
    end
end
