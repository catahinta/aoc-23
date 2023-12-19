require_relative "../challenge.rb"

RSpec.describe "challenge#get_differences" do
  it "should return an array" do
    expect(get_differences([1, 2, 3]).class).to eq(Array)
  end

  it "should return the correct sequence" do
    expect(get_differences([0, 2, 4, 6, 8])).to eq([2, 2, 2, 2])
  end

  it "should handle negative numbers" do
    expect(get_differences([-3, -1, 1, 3, 5])).to eq([2, 2, 2, 2])
  end
end

RSpec.describe "challenge#get_all_differences" do
  it "should return an array" do
    expect(get_all_differences([]).class).to eq(Array)
  end

  it "should return the correct sequence" do
    expect(get_all_differences([1, 3, 6, 10, 15, 21])).to eq([[2, 3, 4, 5, 6], [1, 1, 1, 1], [0, 0, 0]])
  end
end

RSpec.describe "challenge#get_next_value" do
  it "should return an integer" do
    expect(get_next_value([1, 2, 3]).class).to eq(Integer)
  end

  it "should return the correct value" do
    expect(get_next_value([1, 3, 6, 10, 15, 21])).to eq(28)
    expect(get_next_value([10, 13, 16, 21, 30, 45])).to eq(68)
  end
end
