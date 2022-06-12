require 'Date'

class Offset

	attr_reader :key, :date, :letters
	def initialize(key, date = Date.today)
		@key = key
		@date = date
		@letters = ["A", "B", "C", "D"]
	end
	
	def key_format
		numbers = (key.split("")).map {|num| num.to_i}
		keys_arr = numbers.each_cons(2).to_a
		keys_arr.map {|key| key.join.to_i}
	end
	
	def date_check
		if @date.class == Date
			@date.strftime("%d%m%Y")
		elsif
			@date.class == String
			@date
		end
	end

	def date_format
		squared = date_check.to_i ** 2
		digits = squared.to_s[-4..-1]
		digits.split("").map {|num| num.to_i}
	end

	def shift_format
		final_shifts = []
		key_format.each_with_index do |key, k_idx|
			date_format.each_with_index do |date, d_idx|
				if k_idx == d_idx
				   final_shifts << key + date
					break if final_shifts.size == 4
				end
			end
		end
		final_shifts
	end

	def shift_hash
		hash = Hash[@letters.zip(shift_format)]
		hash.transform_keys(&:to_sym)
	end
end

