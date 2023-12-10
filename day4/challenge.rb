cards = []

File.open("input.txt").each_line do |line|
  cards << line.gsub(/Card\s{1,3}\d{1,3}:/, "")
end

def amount_of_winning_numbers(card)
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
  good_numbers.length
end

def calculate_score(card)
  good_numbers = amount_of_winning_numbers(card)
  if good_numbers.length == 0
    return 0
  elsif good_numbers.length == 1
    return 1
  else
    return 2 ** (good_numbers.length - 1)
  end
end

# calculate_score("41 48 83 86 17 | 83 86  6 31 17  9 48 53")
# calculate_score(" 1 21 53 59 44 | 69 82 63 72 16 21 14  1")


def get_total(cards)
  sum = 0
  cards.each do |card|
    score = calculate_score(card)
    sum += score
  end
  sum
end

# get_total(cards)

# part 2

cards_hash = {}
cards.each_with_index do |card, index|
  cards_hash[index + 1] = card
end

def total_cards(cards_hash)
  counter_hash = {}
  cards_hash.length.times do |i|
    counter_hash[i + 1] = 1
  end
  cards_hash.each do |number, card|
    amount_of_winning_numbers(card).times do |i|
      counter_hash[number + i + 1] += counter_hash[number]
    end
  end
  total = 0
  counter_hash.values.each do |value|
    total += value
  end
  total
end

example = {
  1=>"41 48 83 86 17 | 83 86  6 31 17  9 48 53",
  2=>"13 32 20 16 61 | 61 30 68 82 17 32 24 19",
  3=>" 1 21 53 59 44 | 69 82 63 72 16 21 14  1",
  4=>"41 92 73 84 69 | 59 84 76 51 58  5 54 83",
  5=>"87 83 26 28 32 | 88 30 70 12 93 22 82 36",
  6=>"31 18 13 56 72 | 74 77 10 23 35 67 36 11"
}

total_cards(example)

p total_cards(cards_hash)
