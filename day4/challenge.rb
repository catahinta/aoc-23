cards = []

File.open("input.txt").each_line do |line|
  cards << line.gsub(/Card\s{1,3}\d{1,3}:/, "")
end

def calculate_score(card)
  winning_numbers = []
  card.split("|")[0].split.each do |num|
    winning_numbers << num.to_i
  end
  my_numbers = []
  card.split("|")[1].split.each do |num|
    my_numbers << num.to_i
  end
  good_numbers = my_numbers.select do |num|
    winning_numbers.include?(num)
  end
  if good_numbers.length == 0
    return 0
  elsif good_numbers.length == 1
    return 1
  else
    return 2 ** (good_numbers.length - 1)
  end
end

calculate_score("41 48 83 86 17 | 83 86  6 31 17  9 48 53")
calculate_score(" 1 21 53 59 44 | 69 82 63 72 16 21 14  1")


def get_total(cards)
  sum = 0
  cards.each do |card|
    score = calculate_score(card)
    sum += score
  end
  sum
end

p get_total(cards)
