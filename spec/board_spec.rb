require './board.rb'

describe Board do
  let(:board) {Board.new}
  describe "Testing methods for full board" do
    it "empty board" do
      expect( board.full?  ).to eql( false )
    end
    it "full board" do
      for i in 1..9 do
        board.write(i, "X")
      end
      expect(board.full?).to eql( true )
    end
  end 
end