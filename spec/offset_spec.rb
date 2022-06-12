require './lib/offset.rb'

RSpec.describe Offset do
	let(:set) {Offset.new("02715")}

	it 'exists & has attributes' do
			expect(set).to be_a(Offset) 
			expect(set.letters).to be_a(Array)
			expect(set.key).to eq("02715")
			expect(set.date).to be_a(Date)
	end

	it 'can be Datetime object or String' do
		set = Offset.new("02715", "040895")

		expect(set.date).to eq("040895")
		expect(set.date).to be_a(String)
	end

	it 'can create a new key' do
			expect(set.key_format).to be_a(Array)
			expect(set.key_format.size).to eq(4)
	end

	it 'can create new offsets from the date' do
			expect(set.date_check).to be_a(Integer)
			expect(set.date_check.size).to eq(8)
	end

	it 'can format the date with a date object' do
		expect(set.date_format).to eq([8, 4, 8, 4])
	end

	it 'can format the date with a string object' do
		set = Offset.new("02715", "040895")
		expect(set.date_format).to eq([1, 0, 2, 5])
	end

	it 'can format a string key' do
			expect(set.shift_format.size).to eq(4)
			expect(set.shift_format).to eq([10, 31, 79, 19])
	end

	it 'has a shift hash of final offsets' do
		expected = {
							A: 10,
							B: 31,
							C: 79,
							D: 19
		}
			expect(set.shift_hash).to be_a(Hash)
			expect(set.shift_hash.size).to eq(4)
			expect(set.shift_hash).to eq(expected)
	end
end