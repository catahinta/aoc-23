input = File.open("input.txt").read
input_array = input.split

def get_results(input_array)
  sum = 0
  input_array.each do |input|
    first = input.scan(/\d/).first.to_i
    last = input.scan(/\d/).last.to_i
    number = (first * 10) + last
    sum += number
  end
  sum
end

p get_results(["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"])
p get_results(input_array)
