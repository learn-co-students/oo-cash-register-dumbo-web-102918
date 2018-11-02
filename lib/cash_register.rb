require "pry"

class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = {}
  end


  def add_item(title, price, quantity=1)
      amount = quantity
      until amount == 0
        @items[title] = [price, quantity]
        amount -= 1
      end
    @total += (price * quantity)
  end



  def apply_discount
    unless discount == 0
      @total -= (@total * discount.to_f/100).to_i
      return "After the discount, the total comes to $#{@total}."
    end
    "There is no discount to apply."
  end

  def items
    result = []
    @items.each do |key, value|
      count = value[1]
      until count == 0
        result << key
        count -= 1
      end
    end
    result
  end

  def void_last_transaction
    @total -= @items["tomato"][0]
  end


end
