class Card
    def self.identify(deck, index)
        card = []
        suit = deck[index][0]
        value = deck[index][1]
        card << suit
        card << value
        return card
    end
end

class Deck
    def self.generate_shuffled_deck()
        deck = []
        type_suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
        type_values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
        type_suits.each do |suit|
            type_values.each do |value|
                deck << [suit, value]
            end
        end
        return deck.shuffle
    end


    def self.deal_card(deck)
        card = Card.identify(deck, 0)
        return card
    end

end

class Hand
    def self.create_hand(amount, players)
        hand = []
        count = 0
        shuffled_deck = Deck.generate_shuffled_deck()
        while count < amount
            next_card = Deck.deal_card(shuffled_deck)
            shuffled_deck.delete next_card
            hand << next_card
            count += 1
        end
        return hand
    end
end

class Player
    #something
end

class Game
    def self.start_game()
        hand = Hand.create_hand(5, 5)
        puts "Player receives a new hand containing:"
        card_index = 0
        for card in hand
            puts "#{hand[card_index][1]} of #{hand[card_index][0]}"
            card_index += 1
        end
    end
end





