require "pry"
class CashRegister
  attr_accessor :total, :discount, :item_list, :last_transaction
  def initialize(*arg)
    @discount = arg.join.to_i
    @total = 0
    @item_list = []
  end

  def add_item(item_name, price, *quantity)
    num = quantity.join.to_i
    if num > 1
      self.total += (price * num)
      self.item_list << ((item_name + " ")* 3).split(" ")
      self.item_list.flatten!
    else
      self.total += price
      self.item_list << item_name
    end
    self.last_transaction = price
  end

  def apply_discount
    if self.discount > 0
      discount = self.total * (self.discount.to_f/100)
      new_price = (self.total -= discount).to_i
      "After the discount, the total comes to $#{new_price}."
    else
      self.total
      "There is no discount to apply."
    end
  end

  def items
    self.item_list
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end


end
