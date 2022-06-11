require './lib/generator.rb'

RSpec.describe Generator do
    let(:gen) {Generator.new}

    it 'exists' do
        expect(gen).to be_a(Generator) 
        expect(gen.key).to eq(nil)
        expect(gen.date_key).to eq(nil)
    end

    it 'can create a new key' do
        expect(gen.new_key).to be_a(Array)
        expect(gen.new_key.size).to eq(4)
        expect(gen.new_key.first.size).to eq(2)
    end

    it 'can create a new date key' do
        expect(gen.new_date).to be_a(Array)
        expect(gen.new_date.size).to eq(4)
    end
end