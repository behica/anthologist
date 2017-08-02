require 'stripe'
class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story
  
  def new
    
  end
  
  def create
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
    
    #current_user.update(customer_id: customer.id)
    
    flash[:notice] = "Thank you for your purchase, #{current_user.email}!"
    redirect_to @story
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  def find_story
    @story = Story.find(params[:story_id])
  end
end