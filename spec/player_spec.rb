require './player.rb'

RSpec.describe Player do
    let (:player) { Player.new('X')}

    describe "check if input is valid" do
        it "input is valid" do
            expect(player.valid?(1)).to eql(true) 
        end
        it "input is false" do
            expect(player.valid?(11)).to eql(false) 
        end
        it "input is repeated" do
            player.save(1)
            expect(player.valid?(1)).to eql(false) 
        end
    end
    describe "check if victory is achived" do
        it "check method victory?" do
            player.save(9)
            player.save(6)
            player.save(3)
            expect(player.victory?).to eql(true)
        end
        it "check method victory? is false" do
            player.save(6)
            player.save(3)
            expect(player.victory?).to eql(false)
        end
    end
end