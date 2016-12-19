class ReservationsController < ApplicationController
  def new
    if current_user.credits.blank?
      current_user.credits.new(amount: '0.00', escrow_amount: '0.00')
      flash[:alert] = "You do not have sufficient credits. Please top up before proceeding."
      redirect_to deposit_path(current_user)
    else
      credit_balance = current_user.credits.take.amount.to_f
      @listing = Listing.find(params[:listing_id])
      if @listing.price.to_f > credit_balance
        flash[:alert] = "You do not have sufficient credits. Please top up before proceeding."
        redirect_to deposit_path(current_user)
      else
        @listing = Listing.find(params[:listing_id])
        @reservation = Reservation.new
      end
    end
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.create(listing_id: @listing.id, date: reservation_params[:date])
    @credit = Credit.find_by_user_id(current_user.id)
    @credit_escrow = @credit.escrow_amount.to_f
    @new_credit_escrow = @credit_escrow + @listing.price.to_f
    @credit.update(escrow_amount: @new_credit_escrow.to_s)
    @confirmation = Confirmation.create(reservation_id: @reservation.id)
    redirect_to your_reservation_path(current_user.id)
  end

  def your_reservation
    @reservations = current_user.reservations
    render 'your_reservation'
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date)
  end
end
