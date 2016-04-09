require 'json'

def high_cards(gs)
  in_action = gs[:in_action]
  ours = gs[:players][in_action][:hole_cards]
  puts ours rescue puts 'beszoptuk'
end

