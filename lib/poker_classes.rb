class Card
    attr_reader :suit, :value
  
    def initialize(suit, value)
        @suit = suit
        @value = value
    end
    
    def self.identify(deck)
        if deck.empty?
            return nil
        else
            suit = card[0]
            value = card[1]
            return [suit, value]

        end
    end
      

end
  
class Deck
    attr_reader :cards
  
    def initialize
        @cards = self.class.generate_shuffled_deck
    end
  
    def self.generate_shuffled_deck
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
      
  
    def deal_card
        @cards.pop
    end
end
  
class Hand
    def self.create_hand(amount, players)
        hand = []
        count = 0
        deck = Deck.new
        while count < amount
            next_card = deck.deal_card
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
    attr_accessor :hand, :pot
  
    def initialize(hand, pot = 0)
        @hand = hand
        @pot = pot
    end
      
  
    def discard_cards(cards_to_discard)
        cards_to_discard.each do |card|
        @hand.delete(card)
      end
    end
  
    def choose_action
        puts "Player's current hand: #{hand}"
        puts "Options:"
        puts "1. Fold"
        puts "2. See"
        puts "3. Raise"
        print "Enter your choice (1-3): "
        choice = gets.chomp.to_i
    
        case choice
        when 1
            return "Fold"
        when 2
            return "See"
        when 3
            return "Raise"
        else
            puts "Invalid choice. Please enter a number between 1 and 3."
            choose_action
        end
    end
end
  

class Game
    attr_reader :deck, :players, :current_player_index, :pot
  
    def initialize(players)
        @deck = Deck.new
        @players = players
        @current_player_index = 0
        @pot = 0
    end
  
    def start_round
        Hand.create_hand(5, @players)
        place_bets
        collect_bets
        determine_winner
        end_round
    end
  
    private
  
    def place_bets
        players.each do |player|
            puts "Player #{players.index(player) + 1}'s turn:"
            action = player.choose_action
            case action
                when "Fold"
                    puts "Player #{players.index(player) + 1} folds."
                    next
                when "See"
                    @pot += 10
                    player.pot -= 10
                when "Raise"
                    puts "Raise feature not implemented yet."
            end
        end
    end
  
    def collect_bets
        puts "Collecting bets..."
    end
  
    def determine_winner
        puts "Determining the winner..."
    end
  
    def end_round
        puts "Ending the round..."
    end
end

game1 = Game.new([
    Player.new(Hand.create_hand(5, 5), 100),  # Player 1 with a hand of 5 cards and a pot of 100
    Player.new(Hand.create_hand(5, 5), 100)   # Player 2 with a hand of 5 cards and a pot of 100
])

game1.start_round
  



