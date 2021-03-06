class CartItem
  attr_reader :product_id, :quantity

  # refactor 重構       @@ -1,2 +1,2 @@
  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end
  #CartItem.new(1) => 1,1

  def increment!
    @quantity += 1
  end

  def product
    Book.find_by(id: @product_id)  # book / nil
  end

  def total_price
    # (@quantity * product.sell_price)to_i
    @quantity * product.sell_price
  end
end