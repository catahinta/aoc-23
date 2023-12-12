hands_hash = {}

File.open("input.txt").each_line do |line|
  hands_hash[line.split[0]] = line.split[1].to_i
end

def determine_type_ranking(hand)
  cards = hand.chars
  card_counts = []
  cards.each do |card|
    card_counts << cards.count(card)
  end
  return 7 if card_counts.include?(5)
  return 6 if card_counts.include?(4)
  return 5 if card_counts.count(3) == 3 && card_counts.count(2) == 2
  return 4 if card_counts.include?(3)
  return 3 if card_counts.count(2) == 4
  return 2 if card_counts.count(2) == 2
  return 1
end

# p determine_type_ranking("AAAAA")
# p determine_type_ranking("33339")
# p determine_type_ranking("22233")
# p determine_type_ranking("33385")
# p determine_type_ranking("KK838")
# p determine_type_ranking("22948")
# p determine_type_ranking("23456")

def convert_card(card)
  return 10 if card == "T"
  return 11 if card == "J"
  return 12 if card == "Q"
  return 13 if card == "K"
  return 14 if card == "A"
  return card.to_i
end

def convert_hand(hand)
  hand.chars.map do |card|
    convert_card(card)
  end
end

def organise_cards(hands)
  hands.sort! do |hand1, hand2|
    if determine_type_ranking(hand1) == determine_type_ranking(hand2)
      [convert_hand(hand1)[0], convert_hand(hand1)[1], convert_hand(hand1)[2], convert_hand(hand1)[3], convert_hand(hand1)[4]] <=> [convert_hand(hand2)[0], convert_hand(hand2)[1], convert_hand(hand2)[2], convert_hand(hand2)[3], convert_hand(hand2)[4]]
    else
      determine_type_ranking(hand1) <=> determine_type_ranking(hand2)
    end
  end
end

# p organise_cards(hands_hash.keys)

def get_score(hands_hash)
  sum = 0
  ordered_cards = organise_cards(hands_hash.keys)
  ordered_cards.length.times do |i|
    sum += hands_hash[ordered_cards[i]] * (i + 1)
  end
  sum
end

# p get_score(hands_hash)

# part 2

def updated_type_ranking(hand)
  cards = hand.chars
  return determine_type_ranking(hand) unless cards.include?("J")

  card_counts = []
  cards.each do |card|
    card_counts << cards.count(card)
  end

  case cards.count("J")
  when 5
    return 7
  when 4
    return 7
  when 3
    return 7 if card_counts.include?(2)
    return 6
  when 2
    return 7 if card_counts.include?(3)
    return 6 if card_counts.count(2) == 4
    return 4
  when 1
    return 7 if card_counts.include?(4)
    return 6 if card_counts.include?(3)
    return 5 if card_counts.count(2) == 4
    return 4 if card_counts.count(2) == 2
    return 2
  end
end

# p updated_type_ranking("KKKK8")
# p updated_type_ranking("JJJ35")
# p updated_type_ranking("JJJJ8")

def convert_card_with_jokers(card)
  return 10 if card == "T"
  return 1 if card == "J"
  return 11 if card == "Q"
  return 12 if card == "K"
  return 13 if card == "A"
  return card.to_i
end

def convert_hand_with_jokers(hand)
  hand.chars.map do |card|
    convert_card_with_jokers(card)
  end
end

def organise_cards_with_jokers(hands)
  hands.sort! do |hand1, hand2|
    if updated_type_ranking(hand1) == updated_type_ranking(hand2)
      [convert_hand_with_jokers(hand1)[0], convert_hand_with_jokers(hand1)[1], convert_hand_with_jokers(hand1)[2], convert_hand_with_jokers(hand1)[3], convert_hand_with_jokers(hand1)[4]] <=> [convert_hand_with_jokers(hand2)[0], convert_hand_with_jokers(hand2)[1], convert_hand_with_jokers(hand2)[2], convert_hand_with_jokers(hand2)[3], convert_hand_with_jokers(hand2)[4]]
    else
      updated_type_ranking(hand1) <=> updated_type_ranking(hand2)
    end
  end
  hands
end

# p organise_cards_with_jokers(hands_hash.keys)

def get_updated_score(hands_hash)
  sum = 0
  ordered_cards = organise_cards_with_jokers(hands_hash.keys)
  ordered_cards.length.times do |i|
    sum += hands_hash[ordered_cards[i]] * (i + 1)
  end
  sum
end

p get_updated_score(hands_hash)
