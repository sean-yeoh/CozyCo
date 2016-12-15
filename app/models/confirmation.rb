class Confirmation < ActiveRecord::Base
	belongs_to :reservation

	def self.pay_by_cash(reservation_id)
		record = Confirmation.find_by(reservation_id: reservation_id)
		Confirmation.update(record.id, method: "Cash")
	end

	def self.pay_by_credit(reservation_id)
		record = Confirmation.find_by(reservation_id: reservation_id)
		Confirmation.update(record.id, method: "Credit")
	end

	def self.send_cash_payment_message(reservation_id)
		# reservation = Reservation.find(reservation_id)
		# purchaser_id = reservation.user_id
		# seller_id = reservation.listing.user_id
		# purchaser = User.find(purchaser_id).
		# purchaser.send_message(seller, "I will be paying by Cash.", "Cash payment choice by #{purchaser}.")
	end

end
