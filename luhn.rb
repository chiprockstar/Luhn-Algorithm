class Luhn

  def initialize luhn
    @luhn = luhn.to_s
  end

  def addends
    index = 0
    output = ''
    @luhn.reverse.each_char do |char|
      char = char.to_i * 2 >= 10 ?
      ((char.to_i * 2) - 9).to_s : (char.to_i * 2).to_s if index % 2 != 0
      output = output + char
      index += 1
    end
    output.reverse.split("").map { |s| s.to_i }
  end

  def checksum
    checksum = addends.inject(0) { |x,n| x+n }
  end

  def valid?
    checksum % 10 == 0 ? true : false
  end

  def self.create(number)
    0.upto(9) do |check_digit|
      luhn = Luhn.new(number.to_s + check_digit.to_s)
      return (number.to_s + check_digit.to_s).to_i if luhn.valid?
    end
  end
end
