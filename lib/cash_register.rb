require "pry"

class CashRegister

attr_accessor :total, :discount, :items, :prev_tot

def initialize (discount=0)
  @total = 0
  @discount = discount
  @items = []
  @prev_tot = 0
end


def add_item (title,price,quantity = 1)
  quantity.times {@items << title}
  @prev_tot = @total
  @total += (price * quantity)
end

def apply_discount
  if @discount != 0
  @total= @total * (1- 0.01 * @discount)
  "After the discount, the total comes to $#{@total.to_i}."
else
  "There is no discount to apply."
end
end

def void_last_transaction
  @total = @prev_tot
end


end
