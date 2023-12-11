cards_hash = {}

File.open("input.txt").each_line do |line|
  cards_hash[line.split[0]] = line.split[1].to_i
end

def determine_type_ranking(card)
  cards = card.chars
  cards.each do |card|
  end
end

p determine_type_ranking("AAAAA")
p determine_type_ranking("KK838")
