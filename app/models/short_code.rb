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

  def self.decode(string)
  end
end

# ShortCode.encode(1024)
# ShortCode.decode("cf")
