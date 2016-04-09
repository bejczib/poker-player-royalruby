require_relative 'log'
require_relative 'services'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    STDERR.puts "bejottunk a bet_request-be"
    STDERR.puts game_state
    STDERR.puts "========================="
    STDERR.puts game_state[:players]

    # our_rank = card_converter(game_state)[0] + card_converter(game_state)[1]
    0
    # if our_rank > 15
    # 	puts "high"
    # 	10000
    # else
    # 	puts "low"
    # 	0
    # end
  end

  def showdown(game_state)

  end
end


