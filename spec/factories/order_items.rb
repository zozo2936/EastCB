FactoryBot.define do
  factory :order_item do
    book { nil }
    order { nil }
    quantity { 1 }
    sell_price { "9.99" }
  end
end
