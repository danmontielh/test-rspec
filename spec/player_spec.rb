require './player.rb'

describe Player do
    let(:player) { Player.new('X')}

    describe "save method" do
        it "saves the input to an array named inputs" do
            player.save(9)
            player.save(6)
            player.save(3)
            expect(player.inputs).to eql([9,6,3])
        end
    end
    
    describe "reset_inputs method" do
        it "checks if the input array is empty after a reset" do
            player.save(9)
            player.save(6)
            player.save(3)
            player.reset_inputs
            expect(player.inputs).to eql([])
        end
    end

    describe "score_up method" do
        it "updates the player score after a win" do
            player.score_up
            expect(player.score).to eql(1)
            player.score_up
            expect(player.score).to eql(2)
        end
    end
end