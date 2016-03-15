class Product < ActiveRecord::Base
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
end
