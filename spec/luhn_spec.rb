require '../luhn/luhn'

describe 'Luhn' do

  it "will test addends" do
    luhn = Luhn.new(12_121)
    expect(luhn.addends).to match_array([1, 4, 1, 4, 1])
  end

  it "will test too large addends" do
    luhn = Luhn.new(8631)
    expect(luhn.addends).to match_array([7, 6, 6, 1])
  end

  it "will test checksum" do
    luhn = Luhn.new(4913)
    expect(luhn.checksum).to eq(22)
  end

  it "will test checksum again" do
    luhn = Luhn.new(201_773)
    expect(luhn.checksum).to eq(21)
  end

  it "will test invalid number" do
    luhn = Luhn.new(738)
    expect(luhn.valid?).to be false
  end

  it "will test valid number" do
    luhn = Luhn.new(8_739_567)
    expect(luhn).to be_valid
  end

  it "will test creation of a valid number" do
    number = Luhn.create(123)
    expect(number).to eq(1230)
  end

  it "will test creation of another valid number" do
    number = Luhn.create(873_956)
    expect(number).to eq(8_739_567)
  end

  it "will test creation of yet another valid number" do
    number = Luhn.create(837_263_756)
    expect(number).to eq(8_372_637_564)
  end

end
