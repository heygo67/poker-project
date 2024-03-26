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
    def self.generate_deck(type_suits, type_values)
        deck = []
        type_suits.each do |suit|
            type_values.each do |value|
                deck << [suit, value]
            end
        end
        return deck
    end

    def self.shuffle_deck(deck)
        return deck.shuffle
    end

    def self.deal_card(deck, player, amount)
        for index in [0, amount - 1]
            card = Card.identify(deck, index)
            return card
        end
    end

    
end

class Hand
    #something
end

class Player
    #something
end

class Game
    #something
end

class Pot
    #something
end

num_cards_in_deck = 52
type_suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
type_values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

deck = Deck.generate_deck(type_suits, type_values)
shuffled_deck = Deck.shuffle_deck(deck)
player = nil
card = Deck.deal_card(shuffled_deck, player, 5)
print("Player receives ", card[1], " of ", card[0])