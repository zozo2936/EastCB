class Cart
  def initialize
    @items = []  #若是放在下面 則會在每次執行時被清空
  end

  def add_item(params_id)
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
  

end
