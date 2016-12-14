class PaymentsController < ApplicationController
  def payment_method
  	if current_user.credits.empty?
  		Credit.create(user_id: current_user.id, amount: 0, cents: 0, escrow_amount: 0, escrow_cents: 0)
  	end
  end

  def decision
  	if params[:method] == "Cash"
  		# send message to counterparty
  		flash.now[:notice] = "Your choice to pay in cash has been made known to your fellow resident."
  	elsif params[:method] == "Credit"
  		# send message to counterparty
  		# update escrow balance
  		flash.now[:notice] = "Your choice to pay by credit has been made known to your fellow resident."
  	end
  end

  def deposit

  end

  def new
  	@client_token = Braintree::ClientToken.generate
 	amount = params[:amount].split(".")
 	if amount[1].nil?
 		@amount = params[:amount] << ".00"
 	elsif amount[1].length == 1
 		flash.now[:alert] = "There is only 1 decimal. Please input amount again."
 		render "deposit"
 	elsif amount[1].length == 0
 		@amount = params[:amount] << "00"
 	elsif amount[1].length > 2
 		flash.now[:alert] = "There are more than 2 decimals. Please input amount again."
 		render "deposit"
  	end
  end

  def create
  	dollar_amount = (100*params[:amount].to_r).to_i
  	nonce_from_the_client = params[:payment_method_nonce]
  	byebug
  # 	@result = Braintree::Transaction.sale(amount: amount, payment_method_nonce: nonce_from_the_client, :options => {:submit_for_settlement => true})
  # 	if @result.success? || @result.transaction
  # 		@payment = Credit.new(amount: amount, nonce: nonce_from_the_client, cents: ??)
		# respond_to do |format|
		# 	if @payment.save
		# 		format.html { redirect_to reservations_path, notice: 'Reservation for #{listing.address} was succesfully paid for.'}
		# 	end
		# end
  #   else
  #       error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
		# 	respond_to do |format|
		# 		format.html { redirect_to reservations_path, notice: "#{error_messages}"}
		# 	end
    # end
  end

  def confirmation

  end
end
