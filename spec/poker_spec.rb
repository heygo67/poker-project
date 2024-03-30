require 'poker_classes'
shuffled_deck = [["Diamonds", "Ace"], ["Spades", "Five"], ["Diamonds", "King"], ["Hearts", "Eight"], ["Diamonds", "Three"], ["Spades", "Six"], ["Hearts", "Jack"], ["Clubs", "Queen"], ["Spades", "Nine"], ["Spades", "Queen"], ["Hearts", "Nine"], ["Spades", "Three"], ["Hearts", "Queen"], ["Diamonds", "Four"], ["Spades", "Four"], ["Hearts", "Ace"], ["Clubs", "Four"], ["Spades", "Eight"], ["Diamonds", "Nine"], ["Hearts", "Ten"], ["Hearts", "Three"], ["Clubs", "Two"], ["Clubs", "Five"], ["Spades", "Seven"], ["Spades", "Two"], ["Clubs", "Seven"], ["Hearts", "Six"], ["Clubs", "Ten"], ["Diamonds", "Six"], ["Clubs", "Nine"], ["Clubs", "Jack"], ["Diamonds", "Queen"], ["Hearts", "Four"], ["Diamonds", "Seven"], ["Clubs", "King"], ["Hearts", "Seven"], ["Hearts", "Five"], ["Diamonds", "Jack"], ["Diamonds", "Five"], ["Hearts", "Two"], ["Spades", "Ace"], ["Diamonds", "Eight"], ["Clubs", "Eight"], ["Clubs", "Ace"], ["Clubs", "Six"], ["Spades", "King"], ["Spades", "Jack"], ["Spades", "Ten"], ["Hearts", "King"], ["Clubs", "Three"], ["Diamonds", "Two"], ["Diamonds", "Ten"]]
hand = [["Clubs", 9], ["Diamonds", 4], ["Hearts", 6], ["Spades", 4], ["Spades", 2]]
hand2 = [["Ace", "Diamonds"], ["Ten", "Spades"], ["Nine", "Clubs"], ["Ten", "Hearts"], ["Ace", "Clubs"]]
hand3 = [["Queen", "Hearts"], ["Queen", "Spades"], ["Queen", "Diamonds"], ["9", "Clubs"], ["10", "Hearts"]]
hand3_1 = [["King", "Hearts"], ["King", "Spades"], ["King", "Diamonds"], ["9", "Clubs"], ["10", "Hearts"]]
hand4 = [["6", "Hearts"], ["7", "Spades"], ["8", "Diamonds"], ["9", "Clubs"], ["10", "Hearts"]]
hand5 = [["2", "Hearts"], ["6", "Hearts"], ["8", "Hearts"], ["10", "Hearts"], ["Ace", "Hearts"]]
hand6 = [["Ace", "Hearts"], ["Ace", "Spades"], ["King", "Diamonds"], ["King", "Clubs"], ["King", "Hearts"]]
hand7 = [["Ace", "Hearts"], ["Ace", "Spades"], ["Ace", "Diamonds"], ["Ace", "Clubs"], ["King", "Hearts"]]
hand8 = [["10", "Hearts"], ["Jack", "Hearts"], ["Queen", "Hearts"], ["King", "Hearts"], ["Ace", "Hearts"]]
hand9 = [["2", "Hearts"], ["5", "Spades"], ["7", "Diamonds"], ["10", "Clubs"], ["King", "Hearts"]]

RSpec.describe Card do
    
    describe ".identify" do
        it "correctly identifies a card in a deck given index" do
            expect(Card.identify(shuffled_deck).inspect).to eq("[\"Diamonds\", \"Ace\"]")
        end
    end
end

RSpec.describe Hand do
    describe ".hand_type" do
        it "identifies the kind of hand as one pair" do
            expect(Hand.hand_type(hand)).to eq("One Pair")
        end

        it "identifies the kind of hand as two pair" do
            expect(Hand.hand_type(hand2)).to eq("Two Pair")
        end

        it "identifies the kind of hand as three of a kind" do
            expect(Hand.hand_type(hand3)).to eq("Three of a Kind")
        end

        it "identifies the kind of hand as straight" do
            expect(Hand.hand_type(hand4)).to eq("Straight")
        end

        it "identifies the kind of hand as flush" do
            expect(Hand.hand_type(hand5)).to eq("Flush")
        end

        it "identifies the kind of hand as full house" do
            expect(Hand.hand_type(hand6)).to eq("Full House")
        end

        it "identifies the kind of hand as four of a kind" do
            expect(Hand.hand_type(hand7)).to eq("Four of a Kind")
        end

        xit "identifies the kind of hand as straight flush" do
            expect(Hand.hand_type(hand8)).to eq("Straight Flush")
        end

        it "identifies the kind of hand as a high card" do
            expect(Hand.hand_type(hand9)).to eq("High Card")
        end
    end

    describe ".compare_hand_types" do
        it "correctly identifies the winner given two hands" do
            expect(Hand.compare_hand_types(hand9, hand6)).to eq("Hand 2 wins with Full House")
        end

        it "correctly identifies a tie" do
            expect(Hand.compare_hand_types(hand3, hand3_1)).to eq("It's a tie")
        end
    end

    
end
