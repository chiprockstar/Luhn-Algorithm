class Luhn

  def initialize luhn
    @luhn = luhn.to_s
  end

  def addends
    index = 0; output = ''
    charx = ->(x,y) { x.to_i * 2 - y }
    @luhn.reverse.each_char do |char|
      char = (charx.call char, 0) >= 10 ?
      (charx.call char, 9).to_s : (charx.call char, 0).to_s if index.odd?
      output << char
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
    init_arg = ->(x) { number.to_s + x.to_s }
    0.upto(9) do |check_digit|
      luhn = Luhn.new(init_arg.call check_digit)
      return (init_arg.call check_digit).to_i if luhn.valid?
    end
  end
end
