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
  cards = hand.chars.map do |card|
    convert_card(card)
  end
  cards
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
