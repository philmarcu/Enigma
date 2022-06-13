require './lib/shift.rb'
require './lib/offset.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can create a key' do
    expect(enigma.new_key).to be_a(String)
    expect(enigma.new_key.size).to eq(5)
  end

  it 'can encrypt a encryption' do
    message = "Hello World!"
    key = "02715"
    date = "040895"
    
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    expect(enigma.encrypt(message, key, date)).to eq(expected)
  end

  it 'can encrypt a message w/o a given date' do
    message = "Hello World!"
    key = "02715"
    date = Date.today.strftime("%d%m%Y")
    date.slice!(4..5); date
        
    expected = {
      encryption: "pmjdwhugztb!",
      key: "02715",
      date: date
    }

    expect(enigma.encrypt(message, key)).to eq(expected)
  end

  it 'can encrypt a message w/o a given key or date' do
    
    message = "Hello World!"

    expect(enigma.encrypt(message).size).to eq(3)
  end

  it 'can decrypt a message' do
    ciphertext = "keder ohulw!"
    key = "02715"
    date = "040895"

    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }

    expect(enigma.decrypt(ciphertext, key, date)).to eq(expected)
  end

  it 'can decrypt a message without a date' do
    ciphertext = "pmjdwhugztb!"
    key = "02715"
    date = Date.today.strftime("%d%m%Y")
    date.slice!(4..5); date

    expected = {
      decryption: "hello world!",
      key: "02715",
      date: date
    }
    
    expect(enigma.decrypt(ciphertext, key)).to eq(expected)
  end
end
