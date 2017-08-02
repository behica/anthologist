require 'stripe'
class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end
  
  def create
    @story = Story.find(params[:story_id])
    @amount = @story.price.to_i * 100
    
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 	@amount,
      description: "Purchase of #{@story.title} for #{current_user.email}",
      currency: 'usd'
    )
    
    purchase = current_user.purchases.build(story: @story)
    purchase.save
    
    collection = current_user.collections.build(story: @story)
    collection.save
    
    flash[:notice] = "Thank you for your purchase, #{current_user.email}!"
    redirect_to @story
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
end