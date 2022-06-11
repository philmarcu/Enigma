require './lib/generator.rb'

RSpec.describe Generator do
	let(:gen) {Generator.new}

	it 'exists & has attributes' do
			expect(gen).to be_a(Generator) 
			expect(gen.letters).to be_a(Array)
	end

	it 'can create a new key' do
			expect(gen.new_key).to be_a(Array)
			expect(gen.new_key.size).to eq(4)
	end

	it 'can create new offsets from the date' do
			expect(gen.new_date).to be_a(Array)
			expect(gen.new_date.size).to eq(4)
	end

	it 'can add new keys and date keys together' do
			gen.add_keys
			expect(gen.add_keys.size).to eq(4)
	end

	it 'has a shift hash of final offsets' do
			expect(gen.shift_hash).to be_a(Hash)
			expect(gen.shift_hash.size).to eq(4)
			expect(gen.shift_hash.values.first).to be_a(Integer)
	end
end