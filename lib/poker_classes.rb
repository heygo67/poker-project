class Card
    def self.identify(suit, value)
        @suit = suit
        @value = value
        sprintf "%s, %s", @suit, @value
    end
end

class Deck
    def self.shuffle_deck(type_suits, type_values)
        deck = []
        type_suits.each do |suit|
            type_values.each do |value|
                deck << [suit, value]
            end
        end
        return deck.shuffle
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

deck = Deck.shuffle_deck(type_suits, type_values).inspect