require 'rails_helper'

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

    it "商品可以放到購物車裡，也可以再拿出來。" do
      cart = Cart.new

      # 工廠
      # b1 = FactoryBot.create(:book)
      book = create(:book)
  
      cart.add_item(book.id)
      expect(cart.items.first.product).to be_a Book
      # to be_a 我是一種東西
    end

  end
end
