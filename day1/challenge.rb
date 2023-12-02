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

get_results(["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"])
get_results(input_array)

def get_better_results(input_array)
  new_input = input_array.map do |input|
    input.gsub("one", "1").gsub("two", "2").gsub("three", "3").gsub("four", "4").gsub("five", "5").gsub("six", "6").gsub("seven", "7").gsub("eight", "8").gsub("nine", "9")
  end
  get_results(new_input)
end

# p get_better_results(["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen"])
# p get_better_results(input_array)
