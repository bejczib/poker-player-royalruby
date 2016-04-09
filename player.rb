require_relative 'log'
require_relative 'services'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    STDERR.puts "bejottunk a bet_request-be"
    STDERR.puts game_state
    STDERR.puts "========================="
    
    if cards(game_state).uniq.count == 1
      STDERR.puts "high"
      10000
    else
      STDERR.puts "low"
      0
    end
  end

  def cards(game_state)
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
    [card1, card2]
  end

  def showdown(game_state)

  end
end


