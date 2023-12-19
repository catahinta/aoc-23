input = []

File.open("input.txt").each_line do |line|
  input << line.split.map { |num| num.to_i }
end

def get_differences(history)
  differences = []
  (history.length - 1).times do |i|
    differences << (history[i + 1] - history[i])
  end
  differences
end

def get_all_differences(history)
  differences = []
  result = get_differences(history)
  differences << result
  until result.all? { |num| num == 0 }
    result = get_differences(result)
    differences << result
  end
  differences
end

def get_next_value(history)
  differences = get_all_differences(history).reverse
  differences.first << 0
  (differences.length - 1).times do |i|
    differences[i + 1] << (differences[i + 1].last + differences[i].last)
  end
  history.last + differences.last.last
end

def get_sum(input)
  sum = 0
  input.each do |history|
    sum += get_next_value(history)
  end
  sum
end

p get_sum(input)
