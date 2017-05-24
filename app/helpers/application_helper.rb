module ApplicationHelper
	def total_money logs
		sum = 0
		logs.each do |log|
			sum = sum + log.money.to_i
		end
		sum
	end
end
