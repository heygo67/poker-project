require 'poker_classes'
shuffled_deck = [["Diamonds", "Ace"], ["Spades", "Five"], ["Diamonds", "King"], ["Hearts", "Eight"], ["Diamonds", "Three"], ["Spades", "Six"], ["Hearts", "Jack"], ["Clubs", "Queen"], ["Spades", "Nine"], ["Spades", "Queen"], ["Hearts", "Nine"], ["Spades", "Three"], ["Hearts", "Queen"], ["Diamonds", "Four"], ["Spades", "Four"], ["Hearts", "Ace"], ["Clubs", "Four"], ["Spades", "Eight"], ["Diamonds", "Nine"], ["Hearts", "Ten"], ["Hearts", "Three"], ["Clubs", "Two"], ["Clubs", "Five"], ["Spades", "Seven"], ["Spades", "Two"], ["Clubs", "Seven"], ["Hearts", "Six"], ["Clubs", "Ten"], ["Diamonds", "Six"], ["Clubs", "Nine"], ["Clubs", "Jack"], ["Diamonds", "Queen"], ["Hearts", "Four"], ["Diamonds", "Seven"], ["Clubs", "King"], ["Hearts", "Seven"], ["Hearts", "Five"], ["Diamonds", "Jack"], ["Diamonds", "Five"], ["Hearts", "Two"], ["Spades", "Ace"], ["Diamonds", "Eight"], ["Clubs", "Eight"], ["Clubs", "Ace"], ["Clubs", "Six"], ["Spades", "King"], ["Spades", "Jack"], ["Spades", "Ten"], ["Hearts", "King"], ["Clubs", "Three"], ["Diamonds", "Two"], ["Diamonds", "Ten"]]

RSpec.describe Card do
    
    describe ".identify" do
        it "correctly identifies a card in a deck given index" do
            expect(Card.identify(shuffled_deck, 2)).to eq("Diamonds, King")
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
