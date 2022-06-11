require './lib/generator.rb'

RSpec.describe Generator do
    let(:gen) {Generator.new}

    it 'exists' do
        expect(gen).to be_a(Generator) 
    end

    it 'can create a new key' do
        expect(gen.new_key).to be_a(String)
        expect(gen.new_key.size).to eq(5)
    end
end