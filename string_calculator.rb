class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)

      delimiter = if parts[0].include?("[")
                    Regexp.new(parts[0].scan(/\[([^\]]+)\]/).flatten.map { |d| Regexp.escape(d) }.join("|"))
                  else
                    Regexp.new(Regexp.escape(parts[0][2..]))
                  end

      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |num| num > 1000 }.sum
  end
end
