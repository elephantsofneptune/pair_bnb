class PaymentsController < ApplicationController
	  #before_action do_some_security_activity_available, only: [:new, :create]

  def new
  	@client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find_by(secure_token: params[:secure_token])
    @payment = Payment.new
    @listing = Listing.find(params[:id])
    @stay = @reservation.end_date - @reservation.start_date
    @total_amount = @stay.to_i * @listing.price.to_i
  end

  def create
  	@stay = @reservation.end_date - @reservation.start_date
    @total_amount = @stay.to_i * @listing.price.to_i
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "#{total_amount}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    # reserve to save the transaction details into database

    redirect_to reservations_path
  end

end
