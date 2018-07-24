class CartController < ApplicationController
  def show
    
  end
  
  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    
    flash[:notice] = "You have added #{accessory.title} to your cart."
    redirect_to accessories_path
  end

  def destroy
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.remove_accessory(accessory.id)
    session[:cart] = @cart.contents

    flash[:notice] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart."
    redirect_to cart_path
  end
end
