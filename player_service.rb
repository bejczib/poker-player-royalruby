require 'sinatra'
require 'json'
require_relative 'player'


set :port, 8090
set :bind, '0.0.0.0'

post "/" do
  if params[:action] == 'bet_request'
    begin
      Player.new.bet_request(JSON.parse(params[:game_state])).to_s
    rescue Exception => e
      puts "======== ERRROR ======="
      puts e.inspect
      puts e.backtrace
    ensure
      10000
    end
  elsif params[:action] == 'showdown'
    Player.new.showdown(JSON.parse(params[:game_state]))
    'OK'
  elsif params[:action] == 'version'
    Player::VERSION
  else
    'OK'
  end
end
