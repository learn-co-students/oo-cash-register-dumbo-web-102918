require 'pry'

class CashRegister

  attr_accessor :total, :discount

  @@all = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity=1)
    @total +=(price * quantity)
    @@all << [title, price, quantity]
  end

  def self.all
    @@all
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * @discount / 100)
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    filter_self_items = @@all.select do |item|
      item[1] == 1.99 || item[1] == 1.76
    end

    item_titles = []
    filter_self_items.map do |item|
      i = 0
      until i >= item[2]
      item_titles << item[0]
      i += 1
      end
    end
    item_titles
  end

  def void_last_transaction 
    @total -= @@all.last[-2]
  end

end
