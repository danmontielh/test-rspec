require './player.rb'

RSpec.describe Player do
    describe "check if input is valid" do
        example "input is valid" do
            player = Player.new("X")
            expect(player.valid?(1)).to eql(true) 
        end
        example "input is false" do
            player = Player.new("X")
            expect(player.valid?(11)).to eql(false) 
        end
        example "input is repeated" do
            player = Player.new("X")
            player.save(1)
            expect(player.valid?(1)).to eql(false) 
        end
    end
    describe "check if victory is achived" do
        example "check method victory?" do
            player = Player.new("X")
            player.save(9)
            player.save(6)
            player.save(3)
            expect(player.victory?).to eql(true)
        end
        example "check method victory? is false" do
            player = Player.new("X")
            player.save(6)
            player.save(3)
            expect(player.victory?).to eql(false)
        end
    end
end