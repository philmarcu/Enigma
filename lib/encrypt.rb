require './lib/enigma'

enigma = Enigma.new

message, crypt_file = ARGV

msg_txt = File.open(message, 'r') {|file| file.read}

crypt = enigma.encrypt(msg_txt)

encrypter = File.open(crypt_file, 'w')

encrypter.write(crypt[:encryption])

p "Created '#{crypt_file}' with the key #{crypt[:key]} date #{crypt[:date]}"

# 86304