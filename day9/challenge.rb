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

# p get_differences([0, 3, 6, 9, 12, 15])
