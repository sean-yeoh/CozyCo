class Credit < ActiveRecord::Base
	belongs_to :user

	# def credit_balance?
	# 	if Credit.find_by(user_id: self.id).nil?
	# 		return "0.00"
	# 	else
	# 		record = Credit.find_by(user_id: self.id)
	# 		amount = record.amount
	# 		cents = record.cents
	# 		return "#{amount}.#{cents}"
	# 	end
	# end

end
