require 'poker_classes'

RSpec.describe Card do
    describe ".identify" do
        it "correctly sets suit and value" do
            expect(Card.identify("Hearts", "7")).to eq("Hearts, 7")
        end
    end
end

RSpec.describe Deck do
    describe ".initialize" do
        xit "identifies the number of cards in the deck" do
            expect(Deck.initialize()).to eq(52)
        end
    end

    
end
