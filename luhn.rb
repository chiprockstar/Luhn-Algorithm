class Luhn

  def initialize luhn
    @luhn = luhn.to_s
  end

  def addends
    index = 0; output = ''; charx2 = "char.to_i * 2"
    @luhn.reverse.each_char do |char|
      char = eval(charx2) >= 10 ?
      ((eval(charx2)) - 9).to_s : (eval(charx2)).to_s if index.odd?
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
