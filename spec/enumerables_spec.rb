require './enumerables.rb'

describe "#my_select" do
  it "selects odd numbers" do
    x = [1, 2, 3]
    expect(x.my_select {|x| x%2 != 0}).to eql([1, 3])
  end
  it "selects 4 character long strings" do
    x = ["anna", "banana", "four"]
    expect(x.my_select {|x| x.length == 4}).to eql(["anna", "four"])
  end
  it "selects integers" do
    x = ["anna", "banana", "four", 1, 2, 3]
    expect(x.my_select {|x| x.is_a? Integer}).to eql([1, 2, 3])
  end
end

describe "#my_all?" do
  it "checks if every element is bigger than 2" do
    x = [1, 2, 3]
    expect(x.my_all? {|x| x > 2}).to eql(false)
  end
  it "checks if every element is boring" do
    x = ["boring", "boring", "boring"]
    expect(x.my_all? {|x| x == "boring"}).to eql(true)
  end
end

describe "#my_any?" do
  it "checks if any element is bigger than 2" do
    x = [1, 2, 3]
    expect(x.my_any? {|x| x > 2}).to eql(true)
  end
  it "checks if any element is not boring" do
    x = ["boring", "boring", "boring"]
    expect(x.my_any? {|x| x == "not_boring"}).to eql(false)
  end
end

describe "#my_none?" do
  it "checks if no element is bigger than 2" do
    x = [1, 2, 3]
    expect(x.my_none? {|x| x > 2}).to eql(false)
  end
  it "checks if no element is not boring" do
    x = ["boring", "boring", "boring"]
    expect(x.my_none? {|x| x == "not_boring"}).to eql(true)
  end
end

describe "#my_count" do
  it "counts elements in the array with no parameters" do
    x = [1, 2, 3]
    expect(x.my_count).to eql(3)
  end
  it "counts elements equal to 1 in the array" do
    x = [1, 2, 3]
    expect(x.my_count(1)).to eql(1)
  end
  it "counts elements bigger than 1 in the array" do
    x = [1, 2, 3]
    expect(x.my_count {|x| x > 1}).to eql(2)
  end
end

describe "#my_inject" do
  it "sums all the elements in the array with no starting memo" do
    x = [1, 2, 3]
    expect(x.my_inject {|sum, x| sum + x}).to eql(6)
  end
  it "sums all the elements in the array with starting memo = 1" do
    x = [1, 2, 3]
    expect(x.my_inject(1) {|sum, x| sum + x}).to eql(7)
  end
  it "subtracts all the elements in the array" do
    x = [1, 2, 3]
    expect(x.my_inject {|sum, x| sum - x}).to eql(-4)
  end
end

describe "#my_map" do
  it "sums 1 to every element in the array" do
    x = [1, 2, 3]
    expect(x.my_map {|x| x + 1}).to_not eql([3, 4, 5])
  end
  it "sums 1 to every element in the array" do
    x = [1, 2, 3]
    expect(x.my_map {|x| x + 1}).to eql([2, 3, 4])
  end
end
