class PaymentsController < ApplicationController
  def index
  end

  def decision
  	if params[:method] == "Cash"
  		# counterparty = 
  	flash[:payment] = "Your choice to pay in cash has been made known to your fellow resident."
  	elsif params[:method] == "Credit"
  	flash[:payment] = "Your choice to pay by credit has been made known to your fellow resident."
  	end
  	render "index"
  end
end
