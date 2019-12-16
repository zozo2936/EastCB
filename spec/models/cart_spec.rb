require 'rails_helper'

RSpec.describe Cart, type: :model do
  # let(:cart) {Cart.new}
  context "進階功能" do
    it "可以將購物車內容轉換成 Hash 並存到 Session 裡" do
      cart = Cart.new
    
      book1 = create(:book)
      book2 = create(:book)

      3.times { cart.add_item(book1.id) }
      2.times { cart.add_item(book2.id) }

      cart_hash = {
        "items" => [
          {"product_id" => 1, "quantity" => 3},
          {"product_id" => 2, "quantity" => 2}
        ]
      }
      
      expect(cart.serialize).to eq cart_hash
          # 序列化 or hash
    end
  
    it  "也可以存放在 Session 的內容( Hash 格式 )，還原成購物車內容" do
      cart_hash = {
        "items" => [
          {"product_id" => 1, "quantity" => 3},
          {"product_id" => 2, "quantity" => 2}
        ]
      }
      cart = Cart.from_hash(cart_hash)  # .from_hash 是一個類別方法

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end
  end

  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do 
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).to be false
      # expect(cart).not_to be_empty
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

    it "可以計算整台購物車的總消費金額。" do
      #AAA  
      # Arrange

      cart = Cart.new
      book1 = create(:book, sell_price: 50)
      book2 = create(:book, sell_price: 100)
    
      #Act
      3.times { cart.add_item(book1.id) }
      2.times { cart.add_item(book2.id) }
      
      #Assert
      expect( cart.total_price).to eq 350  
    end
  end
end
