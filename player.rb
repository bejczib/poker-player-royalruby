require_relative 'log'
require_relative 'services'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    STDERR.puts "bejottunk a bet_request-be"
    STDERR.puts game_state
    STDERR.puts "========================="
    
    if cards_in_hand(game_state).uniq.count == 1
      STDERR.puts "high"
      10000
    else
      STDERR.puts "low"
      0
    end
  end

  def showdown(game_state)

  end
end


