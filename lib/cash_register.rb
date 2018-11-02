require 'pry'
class CashRegister
  attr_accessor :total, :discount,
  :price, :title, :quantity, :last_tr, :items

def initialize(discount = 0)
@total = 0
@discount = discount
@items = []
#@last_tr = 0
#@title = title

end

# def total
#   @total
# end

def add_item(title, price, quantity = 1)
  self.total += price * quantity
#item.add_item("egg", 0.98, 3)
#binding.pry
self.last_tr = price * quantity
quantity.times do
  @items << title
end
end


def apply_discount
 if discount > 0
  self.total -= self.total*discount/100
   "After the discount, the total comes to $#{self.total}."
 else
   "There is no discount to apply."
  #binding.pry
 end
end

def items
  @items
   #binding.pry
end
#
def void_last_transaction
  self.total -= self.last_tr
end
#binding.pry
end
# bag = CashRegister.new
# bag.add_item("apple", 3, 5)
