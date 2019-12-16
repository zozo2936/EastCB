FactoryBot.define do
  factory :book do
    title      { Faker::Games::Pokemon.name }
    isbn       { SecureRandom.hex(5).upcase }
    isbn13     { SecureRandom.hex(6).upcase }
    list_price { [*10..100].sample }
    sell_price { [*10..100].sample }
    page_num   { [*100..1000].sample }

    publisher
    category
    # 會自動找到2個的工廠
  end
end

# def generate_isbn(n)
#   ([*'A'..'Z'] + [*0..9]).sample(n).join
# end
