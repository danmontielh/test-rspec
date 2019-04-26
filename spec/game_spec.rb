require './game.rb'
require './player.rb'
require './board.rb'

describe Game do
    let(:game) {Game.new(Player.new("X"), Player.new("O"), Board.new)}

    describe "change_active_player method" do
        it "changes the active player between two players" do
            previous_active = game.active_player
            game.change_active_player
            expect(game.active_player).not_to eql(previous_active)
            game.change_active_player
            expect(game.active_player).to eql(previous_active)
        end 
    end

    describe "tie? method" do
        it "checks for tie condition with full board" do
            for i in 1..9 do
                game.board.write(i, "X")
            end
            expect(game.tie?(game.board)).to eql(true)
        end
        it "checks for tie condition with not full board" do
            for i in 1..5 do
                game.board.write(i, "X")
            end
            expect(game.tie?(game.board)).to eql(false)
        end
        it "checks for tie condition with empty board" do
            expect(game.tie?(game.board)).to eql(false)
        end
    end

    describe "victory? method" do
        it "checks incomplete victory conditions and returns false" do
            game.p1.save(3)
            game.p1.save(6)
            expect(game.victory?(game.p1)).to eql(false)
        end
        it "checks complete victory conditions and returns true" do
            game.p1.save(3)
            game.p1.save(6)
            game.p1.save(9)
            expect(game.victory?(game.p1)).to eql(true)
        end
    end

    describe "valid? method for inputs in (1..9)" do
        it "checks if 1 is valid with taken inputs = [3, 6]" do
            game.p1.save(3)
            game.p2.save(6)
            expect(game.valid?(1)).to eql(true)
        end
        it "checks if 3 is valid with taken inputs = [3, 6]" do
            game.p1.save(3)
            game.p2.save(6)
            expect(game.valid?(3)).to eql(false)
        end
        it "checks if 6 is valid with taken inputs = [3, 6]" do
            game.p1.save(3)
            game.p2.save(6)
            expect(game.valid?(6)).to eql(false)
        end
        it "checks if 20 is valid" do
            expect(game.valid?(20)).to eql(false)
        end
    end
end