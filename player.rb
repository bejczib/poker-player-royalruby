require_relative 'log'
require 'net/http'
require 'json'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    STDERR.puts "bejottunk a bet_request-be"
    STDERR.puts "========================="

    if preflop(game_state)
      STDERR.puts "PREFLOP"
      rank = strtinghand_strength(game_state)
      # LOGIC
      if rank <= 4
        0
      elsif rank < 8
        game_state['current_buy_in'] - game_state['players'][0]['bet']
      else
        10000
      end

    else  
      STDERR.puts "POSTFLOP"
      calculate_bet(game_state)
    end

  end

  def preflop(game_state)
    game_state['community_cards'].empty?
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
      elsif sorted_hand == [9, 14] || sorted_hand == [8, 14] || sorted_hand == [7, 14] || sorted_hand == [6, 14] || sorted_hand == [7, 14] || sorted_hand == [6, 14] || sorted_hand == [5, 14] || sorted_hand == [4, 14] || sorted_hand == [3, 14] || sorted_hand == [2, 14] || sorted_hand == [9, 12] || sorted_hand == [8, 10] || sorted_hand == [7, 9] || sorted_hand == [7, 8] || sorted_hand == [6, 7]
        6
      elsif sorted_hand == [9, 13] || sorted_hand == [8, 11] || sorted_hand == [6, 8] || sorted_hand == [5, 7] || sorted_hand == [4, 5]
        5
      elsif sorted_hand == [8, 13] || sorted_hand == [7, 13] || sorted_hand == [6, 13] || sorted_hand == [5, 13] || sorted_hand == [4, 13] || sorted_hand == [3, 13] || sorted_hand == [2, 13] || sorted_hand == [8, 12] || sorted_hand == [7, 10] || sorted_hand == [4, 6] || sorted_hand == [3, 5] || sorted_hand == [3, 4]
        4
      elsif sorted_hand == [7, 11] || sorted_hand == [6, 9] || sorted_hand == [5, 8] || sorted_hand == [4, 7] || sorted_hand == [2, 4] || sorted_hand == [2, 3]
        3
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
      elsif sorted_hand == [7, 7] || sorted_hand == [11, 13] || sorted_hand == [11, 12] || sorted_hand == [10, 12]
        6
      elsif sorted_hand == [6, 6] || sorted_hand == [5, 5] || sorted_hand == [10, 14] || sorted_hand == [10, 13] || sorted_hand == [10, 12]
        5
      elsif sorted_hand == [4, 4] || sorted_hand == [3, 3] ||sorted_hand == [2, 2]
        4
      elsif sorted_hand == [9, 14] || sorted_hand == [9, 13] || sorted_hand == [9, 12] || sorted_hand == [8, 11] || sorted_hand == [8, 10] || sorted_hand == [7, 8] || sorted_hand == [6, 7] || sorted_hand == [5, 6] || sorted_hand == [4, 5]
        3
      else
        2
      end
    end
  end



  def get_rainman(gs)
    cards = cards(gs)
    uri = URI('http://rainman.leanpoker.org/rank')
    params = {
          cards: "#{cards}".gsub!("=>",":")
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    res.body
  end

  def cards(gs)
    gs['players'][gs['in_action']]['hole_cards'].push(gs['community_cards']).flatten!
  end

  def raise_bet(gs, num)
    puts minbet(gs) * num
  end

  def minbet(gs)
    gs['minimum_raise']
  end

  def calculate_bet(gs)
    rainman = JSON.parse(get_rainman(gs))
    puts rainman['rank']
    case rainman['rank']
      when 2
        raise_bet(gs, 1)
      when 3
        raise_bet(gs, 2)
      when 4
        raise_bet(gs, 3)
      when 5
        raise_bet(gs, 4)
      when 6
       raise_bet(gs, 5)
      when 7
       raise_bet(gs, 6)
      when 8
        raise_bet(gs, 7)
      else
        raise_bet(gs, 0)
    end
  end


  def showdown(game_state)

  end
end
