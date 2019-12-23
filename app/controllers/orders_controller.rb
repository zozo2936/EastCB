class OrdersController < ApplicationController
before_action :authenticate_user!
layout 'book'

  def index
    # @orders = Order.where(user:current_user)
    @orders = current_user.orders.order(id: :desc)
  end

  def pay
    gateway = Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['9vjqwfnrsddcjmrw'],
      public_key: ENV['w2gk7d5p7vxz8frz'],
      private_key: ENV['8e29feaed32522869a5b8fdad3883f5c'],
    )
    @token = gateway.client_token.generate
    order = current_user.orders.find_by(num: params[:id])
  end

  def paid
    order = current_user.orders.find_by(num: params[:id])
    redirect_to orders_path, notic: '交易完成!'


  end

  def cancel
    # order = Order.find(num: params[:id],user: current_user)
    order = current_user.orders.find_by(num: params[:id])
    order.cancel! 
    # todo 如果已付款 --> 退款
    redirect_to orders_path, notice: "訂單#{order.num}以取消"
  end


  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product,
                               quantity: item.quantity,
                               sell_price: item.product.sell_price)
    end
    
    if @order.save
      #1. 清空購物車
      session['cart9527'] = nil
      
      #2. 進入付款頁
      redirect_to pay_order_path(@order.num), notice:'訂單已成立'
    
    else
      flash[:notice] = @order.errors.full_messages
      redirect_to root_path
      # render 'carts/checkout'
    end

  end


  private
  def order_params
    params.require(:order).permit(:recipient,:tel,:address,:note)
  end
end