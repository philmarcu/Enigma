require 'Date'
require './lib/offset.rb'
require './lib/shift.rb'

class Enigma

  def new_key
    Array.new(5) { rand(0..9) }.join
  end

  def encrypt(message, key = new_key, date = Date.today)
    hash = {}
    shifts = Offset.new(key, date).shift_format
    date = (Offset.new(key, date).date_check).to_s

    hash[:encryption] = Shift.new.forward(message, shifts)
    hash[:key] = key
    hash[:date] = date
    hash
  end

  def decrypt(ciphertext, key, date = Date.today)
    hash = {}
    shifts = Offset.new(key, date).shift_format
    date = (Offset.new(key, date).date_check).to_s
    
    hash[:decryption] = Shift.new.backward(ciphertext, shifts)
    hash[:key] = key
    hash[:date] = date
    hash
  end  
end