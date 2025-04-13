require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it 'returns 0 for an empty string' do
    expect(calculator.add('')).to eq(0)
  end

  it 'returns the number itself for a single number' do
    expect(calculator.add('1')).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(calculator.add('1,2')).to eq(3)
  end

  it 'returns the sum of an unknown amount of numbers' do
    expect(calculator.add('1,2,3,4,5')).to eq(15)
  end

  it 'handles new lines as delimiters' do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it 'handles custom delimiters' do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end
end
