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
