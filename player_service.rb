require 'sinatra'
require 'json'
require_relative 'player'

post "/" do
  if params[:action] == 'bet_request'
    Player.new.bet_request(JSON.parse(params[:game_state])).to_s
  elsif params[:action] == 'showdown'
    Player.new.showdown(JSON.parse(params[:game_state]))
    'OK'
  end
end