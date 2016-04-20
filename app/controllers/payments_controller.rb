class PaymentsController < ApplicationController
	  #before_action do_some_security_activity_available, only: [:new, :create]

  def new
  	@client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:id]) #find id does not need by
    @payment = Payment.new
  end

  def create
    
    
    @reservation = Reservation.find(params[:payment][:reservation_id])
    @payment = Payment.new
    @payment.reservation_id = @reservation.id
    @payment.total_amount = @reservation.stay
    @payment.save
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "#{total_amount}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    # reserve to save the transaction details into database

    redirect_to reservations_url, notice: "Payment complete!"

  end
end
