require './board.rb'

describe Board do
  let(:board) {Board.new}
  describe "Testing methods for full board" do
    it "checks if the board is full with an empty board" do
      expect(board.full?).to eql(false)
    end
    it "checks if the board is full with a full board" do
      for i in 1..9 do
        board.write(i, "X")
      end
      expect(board.full?).to eql(true)
    end
  end
end