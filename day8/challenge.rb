instructions = File.open("directions.txt").read.chars

instructions.delete_at(-1)

network = {}

File.open("map.txt").each_line do |line|
  network[line[0, 3]] = { element: line[0, 3], left: line[7, 3], right: line[12, 3] }
end


def navigate_network(network, instructions)
  counter = 0

  current_position = network["AAA"]
  instruction_position = 1

  until current_position[:element] == "ZZZ"
    next_position = network[current_position[:left]] if instructions[instruction_position - 1] == "L"
    next_position = network[current_position[:right]] if instructions[instruction_position - 1] == "R"
    current_position = next_position
    counter += 1
    if instruction_position == instructions.length
      instruction_position = 1
    else
      instruction_position += 1
    end
  end

  counter
end

# test_instructions = ["L", "L", "R"]
# test_network = { "AAA" => { left: "BBB", right: "BBB", element: "AAA" }, "BBB" => { left: "AAA", right: "ZZZ", element: "BBB" }, "ZZZ" => { left: "ZZZ", right: "ZZZ", element: "ZZZ" } }

# p navigate_network(test_network, test_instructions)

# p navigate_network(network, instructions)

# part 2

def simultaneously_naviage_network(network, instructions)
  current_positions = []
  network.each do |key, value|
    current_positions << value if key.end_with?("A")
  end

  counter = 0
  instruction_position = 1

  until current_positions.all? { |position| position[:element].end_with?("Z") }
    current_positions.each_with_index do |position, index|
      next_position = network[position[:left]] if instructions[instruction_position - 1] == "L"
      next_position = network[position[:right]] if instructions[instruction_position - 1] == "R"
      current_positions[index] = next_position
    end
    counter += 1
    if instruction_position == instructions.length
      instruction_position = 1
    else
      instruction_position += 1
    end
  end

  counter
end
