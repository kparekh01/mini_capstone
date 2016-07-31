class Product < ActiveRecord::Base
  belongs_to :supplier

  def  sales_message
    price.to_f < 2.0 ? "Discount item!" : "Not on sale!"
  end

  def tax
    (price.to_f * 0.09).round(2)
  end

  def total
    (tax + price.to_f).round(2)
  end
end
