class Luhn

  def initialize luhn
    @luhn = luhn
  end

  def addends
    index = 0
    output = ''
    @luhn.to_s.reverse.each_char do |char|
      if index % 2 == 0
        output = output + char
      else
        value = char.to_i * 2 >= 10 ? "#{((char.to_i * 2) - 9)}" : "#{(char.to_i * 2)}"
        output = output + value
      end
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
    i = 0
    while i < 10 do
      luhn = Luhn.new("#{number}#{i}")
      return "#{number}#{i}".to_i if luhn.valid?
      i += 1
    end
  end
end
