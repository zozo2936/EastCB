class Cart
  def initialize(items = [])
    @items = items #若是放在下面 則會在每次執行時被清空
  end

  def add_item(product_id)
    found_item = @items.find{ |item| item.product_id == product_id}
    if found_item
      found_item.increment!
    else
      @items << CartItem.new(product_id)
    end
    # 找到就+1 找不到就生一個給你
  end

  def empty?
    @items.empty?
  end

  attr_reader :items
  # def items 
  #   @items   
  # end

  def total_price 
    # total = 0
    # @items.each do |item|
    #   total = total + item.total_price
    # end
    # return total
    @items.reduce(0) { |sum,item| sum + item.total_price }
    # reduce 會拿第一個元素當初始值，所以要給他 0 
  end

  def serialize
    result = @items.map { |item|
      {"product_id" => item.product_id, "quantity" => item.quantity}
    }

    # result = []
    # @items.eachh do |item|
    #   result << {"product_id" => item.product_id, "quantity" => item.quantity}
    # end
    { "items" => result }
  end

  def self.from_hash(hash = nil)
    # cart_hash = {
    #   "items" =>[
    #     {"product_id" => 1,"quantity" => 3},
    #     {"product_id" => 2,"quantity" => 2}
    #   ]
    # }
    if hash && hash["items"]
      items = []
      hash["items"].each do |item|
        items << CartItem.new( item["product_id"],item["quantity"])
      end

      Cart.new(items)
    else
      # 新車
      Cart.new
    end

  end
end
