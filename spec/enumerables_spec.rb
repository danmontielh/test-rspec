require './enumerables.rb'

RSpec.describe "#my_select" do
  describe "it should mimic the behavior of #select method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_select {|x| x%2 != 0}).to eql(x.select {|x| x%2 != 0})
    end
    example "test 2" do
      x = ["anna", "banana", "four"]
      expect(x.my_select {|x| x.length == 4}).to eql(x.select {|x| x.length == 4})
    end
    example "test 3" do
      x = ["anna", "banana", "four", 1, 2, 3]
      expect(x.my_select {|x| x.is_a? Integer}).to eql(x.select {|x| x.is_a? Integer})
    end
  end
end

RSpec.describe "#my_all?" do
  describe "it should mimic the behavior of #all? method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_all? {|x| x > 2}).to eql(x.all? {|x| x > 2})
    end
    example "test 2" do
      x = ["boring", "boring", "boring"]
      expect(x.my_all? {|x| x == "boring"}).to eql(x.all? {|x| x == "boring"})
    end
  end
end

RSpec.describe "#my_any?" do
  describe "it should mimic the behavior of #any? method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_any? {|x| x > 2}).to eql(x.any? {|x| x > 2})
    end
    example "test 2" do
      x = ["boring", "boring", "boring"]
      expect(x.my_any? {|x| x == "not_boring"}).to eql(x.any? {|x| x == "not_boring"})
    end
  end
end

RSpec.describe "#my_none?" do
  describe "it should mimic the behavior of #none? method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_none? {|x| x > 2}).to eql(x.none? {|x| x > 2})
    end
    example "test 2" do
      x = ["boring", "boring", "boring"]
      expect(x.my_none? {|x| x == "not_boring"}).to eql(x.none? {|x| x == "not_boring"})
    end
  end
end

RSpec.describe "#my_count" do
  describe "it should mimic the behavior of #count method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_count).to eql(x.count)
    end
    example "test 2" do
      x = [1, 2, 3]
      expect(x.my_count(1)).to eql(x.count(1))
    end
    example "test 3" do
      x = [1, 2, 3]
      expect(x.my_count {|x| x > 1}).to eql(x.count {|x| x > 1})
    end
  end
end

RSpec.describe "#my_inject" do
  describe "it should mimic the behavior of #inject method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_inject {|sum, x| sum + x}).to eql(x.inject {|sum, x| sum + x})
    end
    example "test 2" do
      x = [1, 2, 3]
      expect(x.my_inject(1) {|sum, x| sum + x}).to eql(x.inject(1) {|sum, x| sum + x})
    end
    example "test 3" do
      x = [1, 2, 3]
      expect(x.my_inject {|sum, x| sum - x}).to eql(x.inject {|sum, x| sum - x})
    end
  end
end

RSpec.describe "#my_map" do
  describe "it should mimic the behavior of #map method" do
    example "test 1" do
      x = [1, 2, 3]
      expect(x.my_map {|x| x = 1}).to eql(x.map {|x| x = 1})
    end
  end
end
