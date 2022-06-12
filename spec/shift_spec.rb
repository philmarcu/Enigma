require './lib/generator.rb'
require './lib/shift.rb'

RSpec.describe Shift do
	let(:shift) {Shift.new}

	it 'exists & has attributes' do
			expect(shift).to be_a(Shift)
      expect(shift.alphabet).to be_a(Array)
      expect(shift.alphabet.size).to eq(27)
	end

  it 'can convert letters' do
    char = "F"
    index = 0
    shifts = [12, 21, 5, 13]
    direction = 1
    expected = shift.convert_letters(char, index, shifts, direction)

    expect(expected).to eq("r")
  end
end