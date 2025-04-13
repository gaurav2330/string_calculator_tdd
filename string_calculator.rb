class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = Regexp.new(Regexp.escape(parts[0][2..]))
      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |num| num > 1000 }.sum
  end
end
