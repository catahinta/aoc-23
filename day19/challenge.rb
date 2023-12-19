workflows = {}
ratings = []

File.open("input.txt").each_line do |line|
  if line.start_with?(/\w/)
    workflows[line.scan(/^\w{2,3}/).first] = line.scan(/\{.*\}/).first
  end
  if line.start_with?("{")
    rating = {}
    line.rstrip.delete("{").delete("}").split(",").each do |attribute|
      rating[attribute[0]] = attribute.scan(/\d/).join.to_i
    end
    ratings << rating
  end
end
