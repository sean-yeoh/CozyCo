class PaymentsController < ApplicationController
	  protect_from_forgery with: :null_session

  def payment_method

  end

  def decision
    reservation_id = params[:id]
  	if params[:method] == "Cash"
  		# send message to counterparty
      Confirmation.send_cash_payment_message(reservation_id)
      Confirmation.pay_by_cash(reservation_id)
  		flash.now[:notice] = "Your choice to pay in cash has been made known to your fellow resident."
  	elsif params[:method] == "Credit"
  		# send message to counterparty
      Confirmation.send_credit_payment_message(reservation_id)
      Confirmation.pay_by_credit(reservation_id)
  		flash.now[:notice] = "Your choice to pay by credit has been made known to your fellow resident."
  	end
  end

  def deposit
  	if current_user.credits.empty?
  		Credit.create(user_id: current_user.id, amount: 0, escrow_amount: 0)
  	end
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
 	else
 		@amount = params[:amount]
  	end
  end

  def create
  	@id = params[:id]
  	amount = params[:amount]
  	nonce_from_the_client = params[:payment_method_nonce]
  	@result = Braintree::Transaction.sale(amount: amount, payment_method_nonce: nonce_from_the_client, :options => {:submit_for_settlement => true})
  	if @result.success? || @result.transaction
  		record = Credit.find_by(user_id: @id)
  		credit_id = record.id
  		new_credit_amount = (record.amount.to_f + amount.to_f).to_s
  		@deposit = Credit.update(credit_id, amount: new_credit_amount)
		flash.now[:notice] = "You had deposited RM#{amount}. Your current balance is RM#{@deposit.amount}."
		render "create"
    else
		flash.now[:alert] = "There is an error in processing your payment. Please try again."
		redirect_to payment_path
    end
  end

  def confirmation

  end
end
