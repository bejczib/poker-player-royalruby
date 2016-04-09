ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require './player_service'

class PlayerServiceTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    post '/'
    assert last_response.ok?
    assert_equal 'OK', last_response.body
  end

  def test_it_says_hello_world
    post '/', action: 'bet_request'
    assert last_response.ok?
    assert_equal 'OK', last_response.body
  end
end