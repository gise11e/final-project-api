class ChargesController < ApplicationController
  skip_before_action :authenticate_user!
def new
end

  def index
    if current_user.stripe_id.nil?
      render json: nil
    else
      @customer = Stripe::Customer.retrieve(current_user.stripe_id);
      render json: @customer
    end
  end

  def create
    # Amount in cents
    @amount = 500

    @customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    if current_user.stripe_id.nil?
      current_user.stripe_id = @customer.id

      current_user.save
      render json: true
    end

    render json: false

    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'usd'
    # )

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end

end
