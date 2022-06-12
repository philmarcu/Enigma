require 'Date'
require './lib/generator.rb'
require './lib/offset.rb'
require './lib/shift.rb'

class Enigma
  include Generator

  attr_reader :key, :date
  def initialize
    @key = nil
    @date = nil
  end

  def encrypt(message, key = new_key, date = Date.today )
    shifts = Offset.new(key, date).shift_format
    hash = {}
    date = Offset.new(key, date).date_check

    hash[:encryption] = Shift.new.forward(message, shifts)
    hash[:key] = key
    hash[:date] = date
    require 'pry'; binding.pry
  end
end