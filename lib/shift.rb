class Shift

	attr_reader :alphabet
	def initialize
			@alphabet = ("a".."z").to_a << " "
	end

  def convert_letters(char, index, shifts, direction)
    if char_idx = @alphabet.index(char.downcase)
      shift_idx = index % shifts.size
      nu_alphabet = @alphabet.rotate(direction * shifts[shift_idx])
      nu_alphabet[char_idx]
    else
      char
    end
  end
end