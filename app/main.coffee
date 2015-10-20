class Vigenere
  constructor: (key = 'key', alphabet = 'abcdefghijklmnopqrstuvwxyz') ->
    @alphabet = alphabet.split('')
    @key = key.toLowerCase().split('')

  encode: (text) =>
    encoded_text = []
    for char, i in text.split('')
      uppercase = char.toUpperCase() == char
      char = char.toLowerCase() if uppercase
      char_position = @alphabet.indexOf(char)
      if char_position != -1
        cipher_start = @alphabet.indexOf(@key[i % @key.length])
        encoded_char = @alphabet[(char_position + cipher_start) % @alphabet.length]
      else
        encoded_char = char
      encoded_char = encoded_char.toUpperCase() if uppercase
      encoded_text.push(encoded_char)
    encoded_text.join('')

  decode: (text) =>
    decoded_text = []
    for char, i in text.split('')
      uppercase = char.toUpperCase() == char
      char = char.toLowerCase() if uppercase
      char_position = @alphabet.indexOf(char)
      if char_position != -1
        cipher_start = @alphabet.indexOf(@key[i % @key.length])
        decoded_char_position = char_position - cipher_start
        decoded_char_position = @alphabet.length + decoded_char_position if decoded_char_position < 0
        decoded_char = @alphabet[decoded_char_position]
      else
        decoded_char = char
      decoded_char = decoded_char.toUpperCase() if uppercase
      decoded_text.push(decoded_char)
    decoded_text.join('')

window.Vigenere = Vigenere
