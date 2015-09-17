class Item < ActiveRecord::Base
  before_save :convert_unit_price

  belongs_to :merchant
  has_many   :invoice_items

  private

    def convert_unit_price
      unit_price.to_f / 100
    end
end
