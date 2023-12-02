counter = 1
games = {}

File.open("input.txt").each_line do |line|
  line = line.gsub(/Game \d{1,3}: /, "").strip
  games[counter] = line
  counter += 1
end

sum = 0

games.each do |number, game|
  possible = true
  game.split(";").each do |pull|
    pull.split(",").each do |color|
      color = color.strip
      if color.include?("red")
        red_amount = color.slice(0..1).strip.to_i
        possible = false if red_amount > 12
      end
      if color.include?("green")
        green_amount = color.slice(0..1).strip.to_i
        possible = false if green_amount > 13
      end
      if color.include?("blue")
        blue_amount = color.slice(0..1).strip.to_i
        possible = false if blue_amount > 14
      end
    end
  end
  sum += number if possible == true
end

p sum
