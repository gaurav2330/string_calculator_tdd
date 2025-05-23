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

  it 'throws an exception for negative numbers' do
    expect { calculator.add('1,-2,3') }.to raise_error('Negatives not allowed: -2')
  end

  it 'shows all negative numbers in the exception' do
    expect { calculator.add('1,-2,-3') }.to raise_error('Negatives not allowed: -2, -3')
  end

  it 'ignores numbers greater than 1000' do
    expect(calculator.add('2,1001')).to eq(2)
    expect(calculator.add('1001,1002,3')).to eq(3)
  end

  it 'supports delimiters of any length' do
    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
  end

  it 'supports multiple delimiters' do
    expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it 'supports multiple delimiters with length longer than one character' do
    expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
  end
end
