require 'rails_helper'

class Cart
end
# 可以把商品丟到到購物車裡，然後購物車裡就有東西了。
# 如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。
# 商品可以放到購物車裡，也可以再拿出來。
# 每個 Cart Item 都可以計算它自己的金額（小計）。
# 可以計算整台購物車的總消費金額。

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do 
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).not_to be true
    end

    it "如果加了相同種類的商品到購物車裡，購買項目並不會增加，但商品的數量會改變。" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }

      expect(cart.items.count).to be 2  
      expect(cart.items.first.quantity).to be 3  #假設第一個數量應該為三
    end

    it "商品可以放到購物車裡，也可以再拿出來。"
      cart = Cart.new

      p1 = Publisher.create(name: 'kk store')
      c1 = Category.create(title: 'ruby book')

      b1 = Book.create(title: 'hello',
           isbn: 'aaa',
           isbn13: 'bbb', 
           publisher: 'p1', 
           category: 'c1'
          )

  end
end
