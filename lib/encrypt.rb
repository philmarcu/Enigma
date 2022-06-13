require './lib/enigma'

msg_txt = File.read(ARGV[0])

enigma = Enigma.new

ciphertxt = enigma.encrypt(msg_txt)

encrypter = File.open(ARGV[1], 'w')

encrypter.write(ciphertxt[:encryption])

puts "Created '#{ARGV[1]} with the key #{ciphertxt[:key]} date #{ciphertxt[:date]}"

