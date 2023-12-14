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

def map_one_route(network, starting_point, instructions)
  instruction_position = 1
  current_position = starting_point

  counter = 0

  until current_position[:element].end_with?("Z")
    next_position = network[current_position[:left]] if instructions[instruction_position - 1] == "L"
    next_position = network[current_position[:right]] if instructions[instruction_position - 1] == "R"
    current_position = next_position
    if instruction_position == instructions.length
      instruction_position = 1
    else
      instruction_position += 1
    end
    counter += 1
  end
  { counter: counter, position: current_position }
end

def simultaneously_naviage_network(network, instructions)
  starting_positions = []
  ending_positions = []

  network.each do |key, value|
    starting_positions << value if key.end_with?("A")
    ending_positions << value if key.end_with?("Z")
  end

  # counter = 0
  # instruction_position = 1

  # until current_positions.all? { |position| position[:element].end_with?("Z") }
  #   current_positions.each_with_index do |position, index|
  #     next_position = network[position[:left]] if instructions[instruction_position - 1] == "L"
  #     next_position = network[position[:right]] if instructions[instruction_position - 1] == "R"
  #     current_positions[index] = next_position
  #   end
  #   counter += 1
  #   if instruction_position == instructions.length
  #     instruction_position = 1
  #   else
  #     instruction_position += 1
  #   end
  # end

  # counter

  counters_hash = {}

  starting_positions.each_with_index do |position, index|
    counters = []
    first_point = map_one_route(network, position, instructions)
    counter = first_point[:counter]
    counters << first_point[:counter]
    current_position = first_point[:position]
    (ending_positions.length - 1).times do
      result = map_one_route(network, current_position, instructions)
      counters << result[:counter]
      counter += result[:counter]
      current_position = result[:position]
    end
    counters_hash[index + 1] = counters
  end

  counters_hash
end

p simultaneously_naviage_network(network, instructions)
