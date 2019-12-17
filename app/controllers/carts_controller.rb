class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]
  layout 'book'
  
  def add
    current_cart.add_item(params[:id])
    session['cart9527'] = current_cart.serialize

    redirect_to root_path, notice: '成功加入購物車'
  end

  def show
  end
  
  def destroy
    session['cart9527'] = nil
    redirect_to root_path, notice: '已清空'
  end

  def checkout
    @order = Order.new
  end
end
                         