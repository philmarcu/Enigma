require_relative 'enigma'

msg_txt = File.read(ARGV[0])

enigma = Enigma.new

ciphertxt = enigma.decrypt(msg_txt, ARGV[2])

decrypter = File.open(ARGV[1], 'w')

decrypter.write(ciphertxt[:decryption])

puts "Created #{ARGV[1]} with the key #{ciphertxt[:key]} date #{ciphertxt[:date]}"


