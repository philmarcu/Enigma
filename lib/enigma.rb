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
    hash = {}
    shifts = Offset.new(key, date).shift_format
    date = (Offset.new(key, date).date_check).to_s

    hash[:message] = Shift.new.forward(message, shifts)
    hash[:key] = key
    hash[:date] = date
    hash
  end
end