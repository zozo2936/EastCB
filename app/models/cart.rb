class Cart
  def initialize
    @items = []  #若是放在下面 則會在每次執行時被清空
  end

  def add_item(params_id)
    @items << params_id
  end

  def empty?
    @items.empty?
  end
end
