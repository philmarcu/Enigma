require 'Date'

class Generator

    attr_reader :key, :date_key
    def initialize
        @key = nil
        @date_key = nil
    end

    def new_key
        random = Array.new(5) { rand(0..9) }.join
        numbers = (random.split("")).map {|num| num.to_i}
        numbers.each_cons(2).to_a
    end

    def new_date
        date = Date.today
        str = (date.strftime("%d%m%Y").to_i ** 2).to_s
        digits = str[-4..-1]
        digits.split("").map {|num| num.to_i}
    end
end


