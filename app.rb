require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/team')
require('./lib/game')
require('./lib/home_team')
require('./lib/away_team')
require('pg')
require('pry')

get ('/') do
  @games = Game.all()
  @teams = Team.all()
  erb(:index)
end

post('/new/team') do
  name = params.fetch('name')
  team = Team.create({:name=> name})
  redirect to ('/')
end

post('/new/game') do
  home_team_id = Integer(params.fetch('home_team_id'))
  away_team_id = Integer(params.fetch('away_team_id'))
  h_score = Integer(params.fetch('h_score'))
  a_score = Integer(params.fetch('a_score'))
  game = Game.create({:h_score => h_score, :a_score => a_score})
  game_id = game.id
  home = HomeTeam.create({:team_id => home_team_id, :game_id => game.id})
  away = AwayTeam.create({:team_id => away_team_id, :game_id => game.id})
  redirect to ('/')
end
