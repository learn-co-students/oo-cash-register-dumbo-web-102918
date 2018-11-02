require 'pry'

class CashRegister
  attr_accessor :discount, :total
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @@all_items = []
  end

  def add_item(title, price, quantity = 1)
    @@all_items << [title, price, quantity]
    @total += price * quantity
  end

  def apply_discount
    if discount!=0
      @total = @total - ((discount/100.0)*@total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    items_list = []
    @@all_items.each do |item_price_pair|
      item_price_pair.last.times do
        items_list << item_price_pair.first
      end
    end
    items_list
  end

  def void_last_transaction
    @total = @total - @@all_items.last[1]
    # binding.pry
  end


end
