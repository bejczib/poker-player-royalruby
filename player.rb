require_relative 'log'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    STDERR.puts "bejottunk a bet_request-be"
    STDERR.puts game_state
    STDERR.puts "========================="
    
    rank = strtinghand_strength(game_state)

    if rank < 8
      0
    else
      10000
    end
      
  end

  def cards_in_hand(game_state)
    STDERR.puts "cards_in_hand-ben vagyunk"
    if game_state['players'][0]['hole_cards'][0]['rank'] == "J"
      card1 = 11
    elsif game_state['players'][0]['hole_cards'][0]['rank'] == "Q"
      card1 = 12
    elsif game_state['players'][0]['hole_cards'][0]['rank'] == "K"
      card1 = 13
    elsif game_state['players'][0]['hole_cards'][0]['rank'] == "A"
      card1 = 14
    else 
      card1 = game_state['players'][0]['hole_cards'][0]['rank'].to_i
    end

    if game_state['players'][0]['hole_cards'][1]['rank'] == "J"
      card2 = 11
    elsif game_state['players'][0]['hole_cards'][1]['rank'] == "Q"
      card2 = 12
    elsif game_state['players'][0]['hole_cards'][1]['rank'] == "K"
      card2 = 13
    elsif game_state['players'][0]['hole_cards'][1]['rank'] == "A"
      card2 = 14
    else 
      card2 = game_state['players'][0]['hole_cards'][1]['rank'].to_i
    end
    [card1, card2].sort
  end

  def strtinghand_strength(gs)
    STDERR.puts "strtinghand_strength - ben vagyunk"
    sorted_hand = cards_in_hand(gs)
    if gs['players'][0]['hole_cards'][0]['suit'] == gs['players'][0]['hole_cards'][1]['suit'] #suit
      if sorted_hand == [13, 14]
        10
      elsif sorted_hand == [12, 14] || sorted_hand == [11, 14] || sorted_hand == [12, 13]
        9
      elsif sorted_hand == [10, 14] || sorted_hand == [11, 13] || sorted_hand == [11, 12] || sorted_hand == [10, 11]
        8
      elsif sorted_hand == [10, 13] || sorted_hand == [10, 12] || sorted_hand == [9, 11] || sorted_hand == [9, 10] ||sorted_hand == [8, 9]
        7
      else
        2
      end
    else #offsuit
      if sorted_hand == [14, 14] || sorted_hand == [13, 13] || sorted_hand == [12, 12] || sorted_hand == [11, 11]
        10
      elsif sorted_hand == [10, 10] || sorted_hand == [13, 14]
        9
      elsif sorted_hand == [9, 9] || sorted_hand == [12, 14]
        8
      elsif sorted_hand == [8, 8] || sorted_hand == [11, 14] || sorted_hand == [12, 13]
        7
      else
        2
      end
    end
  end

  def showdown(game_state)

  end
end


