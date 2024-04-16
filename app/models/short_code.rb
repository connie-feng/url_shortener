class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = ""

    while number > 0 do
      index = number % BASE
      result.prepend(ALPHABET[index])
      number = number / BASE
    end

    result
  end

  # "4c91" -> 999_999
  # number = 0
  # 1 = 62^0 -> index of "1" -> 1 -> number += 1 * 1 = 1 # (index * power)
  # 9 = 62^1 -> index of "9" -> 9 -> number += 9 * 62 = 558 + 1
  # c = 62^2 -> index of "c" -> 12 -> number += 12 * 3844 = 46687
  # 4 = 62^3 -> index of "4" -> 4 -> number += 4 * 238328 = 999999
  def self.decode(string)
    number = 0

    string.reverse.each_char.with_index do |char, index|
      power = BASE**index
      i = ALPHABET.index(char)
      number += i * power
    end

    number
  end
end

# ShortCode.encode(1024)
# ShortCode.decode("cf")
