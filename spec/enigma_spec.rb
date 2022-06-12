require './lib/generator.rb'
require './lib/shift.rb'
require './lib/offset.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    message = "Hello World!"
    key = "02715"
    date = "040895"
    
    expected = {
      encryption: [3, 27, 73, 20],
      message: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    expect(enigma.encrypt(message, key, date)).to eq(expected)
  end
end
