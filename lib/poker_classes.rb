class Card
    def self.identify(deck)
        card = []
        suit = deck[0][0]
        value = deck[0][1]
        card << suit
        card << value
        return card
    end
end

class Deck
    def self.generate_shuffled_deck()
        deck = []
        type_suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
        type_values = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
        type_suits.each do |suit|
            type_values.each do |value|
                deck << [suit, value]
            end
        end
        return deck.shuffle
    end


    def self.deal_card(deck)
        card = Card.identify(deck)
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

    def self.hand_type(hand)
        values_count = Hash.new(0)
        suits_count = Hash.new(0)
    
        hand.each do |value, suit|
            values_count[value] += 1
            suits_count[suit] += 1
        end
    
        values = values_count.keys.map do |value|
            case value
            when "Ace" then 1
            when "Jack" then 11
            when "Queen" then 12
            when "King" then 13
            else value.to_i
            end
        end.sort
    
        is_straight = (values.last - values.first == 4) && (values.uniq.length == 5)
    
        is_flush = suits_count.values.max == 5
    
        is_straight_flush = is_straight && is_flush
    
        if is_straight_flush
            return "Straight Flush"
        elsif values_count.values.max == 4
            return "Four of a Kind"
        elsif values_count.values.sort == [2, 3]
            return "Full House"
        elsif is_flush
            return "Flush"
        elsif is_straight
            return "Straight"
        elsif values_count.values.max == 3
            return "Three of a Kind"
        elsif values_count.values.sort == [1, 2, 2]
            return "Two Pair"
        elsif values_count.values.max == 2
            return "One Pair"
        else
            return "High Card"
        end
    end

    def self.compare_hand_types(hand1, hand2)

        hand_type_hierarchy = [
            "Straight Flush",
            "Four of a Kind",
            "Full House",
            "Flush",
            "Straight",
            "Three of a Kind",
            "Two Pair",
            "One Pair",
            "High Card"
        ]

        hand_type1 = Hand.hand_type(hand1)
        hand_type2 = Hand.hand_type(hand2)

        index1 = hand_type_hierarchy.index(hand_type1)
        index2 = hand_type_hierarchy.index(hand_type2)
    
        if index1 && index2
            if index1 < index2
                return "Hand 1 wins with #{hand_type1}"
            elsif index1 > index2
                return "Hand 2 wins with #{hand_type2}"
            else
                return "It's a tie"
            end
        else
            return "Invalid hand type"
        end
    end
end

class Player
    def initialize()
        @player = player
    end

end

class Game
    def init_players()
        players_list = []
        puts "How many players?"
        players_count = gets.chomp
        players_list << Player.setup(players_count)
        return players_count
    end

    def self.start_game()
        puts "Dealing 5 cards"
        hand = Hand.create_hand(5, 5)
        puts "Player receives a new hand containing:"
        card_index = 0
        for card in hand
            puts "#{hand[card_index][1]} of #{hand[card_index][0]}"
            card_index += 1
        end
        hand_type = Hand.hand_type(hand)
        puts hand_type.inspect
    end
end


game = Game.start_game()


