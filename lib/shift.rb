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

  def forward(message, shifts)
    split_msg = message.downcase.split("")
    forward_msg = split_msg.map.with_index do |char, index|
      convert_letters(char, index, shifts, 1)
    end
    forward_msg.join  
  end

  def backward(message, shifts)
    split_msg = message.downcase.split("")
    backward_msg = split_msg.map.with_index do |char, index|
      convert_letters(char, index, shifts, -1)
    end
    backward_msg.join
  end
end