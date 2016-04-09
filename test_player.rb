require 'minitest/autorun'

require_relative 'player'
require_relative 'services'

class TestPlayer < MiniTest::Test
	def setup
		@gs = {
    "tournament_id":"550d1d68cd7bd10003000003",
    "game_id":"550da1cb2d909006e90004b1",       
    "round":0,                                  
    "bet_index":0,                             
    "small_blind": 10,                            
    "current_buy_in": 320,                        
    "pot": 400,                                   
    "minimum_raise": 240,                          
    "dealer": 1,                                    
    "orbits": 7,                                   
    "in_action": 1,                                 
    "players": [ 
    		{                                 
            "id": 0,                               
            "name": "Albert",                     
            "status": "active",                    
            "version": "Default random player",     
            "stack": 1010,                         
            "bet": 320                           
        },
        {
            "id": 1,                            
            "name": "Bob",
            "status": "active",
            "version": "Default random player",
            "stack": 1590,
            "bet": 80,
            "hole_cards": [                       
                {
                    "rank": "6",             
                    "suit": "hearts"
                },
                {
                    "rank": "K",
                    "suit": "spades"
                }
            ]
        },
        {
            "id": 2,
            "name": "Chuck",
            "status": "out",
            "version": "Default random player",
            "stack": 0,
            "bet": 0
        }
    ],
    "community_cards": [                        
        {
            "rank": "4",
            "suit": "spades"
        },
        {
            "rank": "A",
            "suit": "hearts"
        },
        {
            "rank": "6",
            "suit": "clubs"
        }
    ]
}

@gs2 = {
    "tournament_id":"550d1d68cd7bd10003000003",
    "game_id":"550da1cb2d909006e90004b1",       
    "round":0,                                  
    "bet_index":0,                             
    "small_blind": 10,                            
    "current_buy_in": 320,                        
    "pot": 400,                                   
    "minimum_raise": 240,                          
    "dealer": 1,                                    
    "orbits": 7,                                   
    "in_action": 1,                                 
    "players": [ 
    		{                                 
            "id": 0,                               
            "name": "Albert",                     
            "status": "active",                    
            "version": "Default random player",     
            "stack": 1010,                         
            "bet": 320                           
        },
        {
            "id": 1,                            
            "name": "Bob",
            "status": "active",
            "version": "Default random player",
            "stack": 1590,
            "bet": 80,
            "hole_cards": [                       
                {
                    "rank": "6",             
                    "suit": "hearts"
                },
                {
                    "rank": "6",
                    "suit": "spades"
                }
            ]
        },
        {
            "id": 2,
            "name": "Chuck",
            "status": "out",
            "version": "Default random player",
            "stack": 0,
            "bet": 0
        }
    ],
    "community_cards": [                        
        {
            "rank": "4",
            "suit": "spades"
        },
        {
            "rank": "A",
            "suit": "hearts"
        },
        {
            "rank": "6",
            "suit": "clubs"
        }
    ]
}

@gs3 = {
    "tournament_id":"550d1d68cd7bd10003000003",
    "game_id":"550da1cb2d909006e90004b1",       
    "round":0,                                  
    "bet_index":0,                             
    "small_blind": 10,                            
    "current_buy_in": 320,                        
    "pot": 400,                                   
    "minimum_raise": 240,                          
    "dealer": 1,                                    
    "orbits": 7,                                   
    "in_action": 1,                                 
    "players": [ 
    		{                                 
            "id": 0,                               
            "name": "Albert",                     
            "status": "active",                    
            "version": "Default random player",     
            "stack": 1010,                         
            "bet": 320                           
        },
        {
            "id": 1,                            
            "name": "Bob",
            "status": "active",
            "version": "Default random player",
            "stack": 1590,
            "bet": 80,

        },
        {
            "id": 2,
            "name": "Chuck",
            "status": "out",
            "version": "Default random player",
            "stack": 0,
            "bet": 0
        }
    ],
    "community_cards": [                        
        {
            "rank": "4",
            "suit": "spades"
        },
        {
            "rank": "A",
            "suit": "hearts"
        },
        {
            "rank": "6",
            "suit": "clubs"
        }
    ]
}
	end
	def test_integer?
		player = Player.new
		assert_equal player.bet_request(@gs).is_a?(Integer), true
	end

	def test_rank_15
		player = Player.new
		assert_equal player.bet_request(@gs), 10000
		assert_equal player.bet_request(@gs2), 0
		assert_equal player.bet_request(@gs3), 0

	end

	def test_pair?
		assert_equal pair?(@gs), false
		assert_equal pair?(@gs2), true
	end

	def test_convert_card
		assert_equal convert_card(@gs, 0), 6
		assert_equal convert_card(@gs, 1), 13
		assert_equal convert_card(@gs2, 0), 6
		assert_equal convert_card(@gs2, 1), 6
	end


end



