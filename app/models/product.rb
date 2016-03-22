class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders

  def format_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def sale_message
    if price < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end 

  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def in_stock
    if quantity != nil
      if quantity > 0
        "In Stock"
      else
        "Out of Stock"
      end
    end
  end
end
