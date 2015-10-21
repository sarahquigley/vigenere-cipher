class Vigenere
  constructor: (key = 'zorya', alphabet = 'abcdefghijklmnopqrstuvwxyz') ->
    @alphabet = alphabet.split('')
    @key = key.toLowerCase().split('')

  encipher: (text) =>
    encoded_text = []
    unencoded_char_count = 0
    for char, i in text.split('')
      uppercase = char.toUpperCase() == char
      char = char.toLowerCase() if uppercase
      char_position = @alphabet.indexOf(char)
      if char_position != -1
        cipher_start = @alphabet.indexOf(@key[(i - unencoded_char_count) % @key.length])
        encoded_char = @alphabet[(char_position + cipher_start) % @alphabet.length]
      else
        unencoded_char_count += 1
        encoded_char = char
      encoded_char = encoded_char.toUpperCase() if uppercase
      encoded_text.push(encoded_char)
    encoded_text.join('')

  decipher: (text) =>
    decoded_text = []
    unencoded_char_count = 0
    for char, i in text.split('')
      uppercase = char.toUpperCase() == char
      char = char.toLowerCase() if uppercase
      char_position = @alphabet.indexOf(char)
      if char_position != -1
        cipher_start = @alphabet.indexOf(@key[(i - unencoded_char_count) % @key.length])
        decoded_char_position = char_position - cipher_start
        decoded_char_position = @alphabet.length + decoded_char_position if decoded_char_position < 0
        decoded_char = @alphabet[decoded_char_position]
      else
        unencoded_char_count += 1
        decoded_char = char
      decoded_char = decoded_char.toUpperCase() if uppercase
      decoded_text.push(decoded_char)
    decoded_text.join('')

window.Vigenere = Vigenere

key_el = document.getElementById('vigenere-key')
text_el = document.getElementById('vigenere-text')
encipher_el = document.getElementById('vigenere-encipher')
decipher_el = document.getElementById('vigenere-decipher')
output_el = document.getElementById('vigenere-output')

encipher_el.addEventListener 'click', (event) ->
  event.preventDefault()
  vigenere = new Vigenere(key_el.value)
  enciphered_text = vigenere.encipher(text_el.value)
  output_el.innerHTML = enciphered_text

decipher_el.addEventListener 'click', (event) ->
  event.preventDefault()
  vigenere = new Vigenere(key_el.value)
  deciphered_text = vigenere.decipher(text_el.value)
  output_el.innerHTML = deciphered_text
