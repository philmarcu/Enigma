require 'Date'

class Generator

	attr_reader :letters
	def initialize
		@letters = ["A", "B", "C", "D"]
	end

	def new_key
		random = Array.new(5) { rand(0..9) }.join
		numbers = (random.split("")).map {|num| num.to_i}
		keys = numbers.each_cons(2).to_a
		keys.map {|key| key.join.to_i}
	end

	def new_date
		date = Date.today
		str = (date.strftime("%d%m%Y").to_i ** 2).to_s
		digits = str[-4..-1]
		digits.split("").map {|num| num.to_i}
	end

	def add_keys
		final_shifts = []
		new_key.each_with_index do |key, k_idx|
			new_date.each_with_index do |date, d_idx|
				if k_idx == d_idx
				   final_shifts << key + date
					break if final_shifts.size == 4
				end
			end
		end
		final_shifts
	end

	def shift_hash
		Hash[@letters.zip(add_keys)]
	end
end

