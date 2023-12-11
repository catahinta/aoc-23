input = {
  48 => 255,
  87 => 1288,
  69 => 1117,
  81 => 1623
}

def winning_amount(time, distance)
  winning_times = (1..time).to_a.select do |num|
    (time - num) * num > distance
  end
  winning_times.length
end

def get_score(input)
  total_score = 1
  input.each do |key, value|
    total_score = winning_amount(key, value) * total_score
  end
  total_score
end

p get_score(input)

# part 2

p winning_amount(48876981, 255128811171623)
