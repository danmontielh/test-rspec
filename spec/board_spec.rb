require './board.rb'

RSpec.describe Board do
  describe "Testing methods for full board" do
    example "empty board" do
      board = Board.new
      expect( board.full?  ).to eql( false )
    end
    example "full board" do
      n_board = Board.new
      for i in 1..9 do
        n_board.write(i, "X")
      end
      expect(n_board.full?).to eql( true )
    end
  end 
end