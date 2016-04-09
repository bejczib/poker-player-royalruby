require 'json'

def high_cards(gs)
  in_action = gs[:in_action]
  ours = gs[:players][in_action][:hole_cards]
  puts ours rescue puts 'beszoptuk'
end

def card_converter(gs)
  STDERR.puts "bejottunk a card_converter-be"
  gs1 = convert_card(gs, 0)
  gs2 = convert_card(gs, 1)
  [gs1, gs2]
end

def convert_card(gs, nr)
  STDERR.puts "bejottunk a convert_card-ba"
  in_action = gs[:in_action]
  if gs[:players][in_action][:hole_cards][nr][:rank] == "J"
    11
  elsif gs[:players][in_action][:hole_cards][nr][:rank] == "Q"
    12
  elsif gs[:players][in_action][:hole_cards][nr][:rank] == "K"
    13
  elsif gs[:players][in_action][:hole_cards][nr][:rank] == "A"
    14
  else 
    gs[:players][in_action][:hole_cards][nr][:rank].to_i
  end
end


def pair?(gs)
  card_converter(gs).uniq.count == 1
end