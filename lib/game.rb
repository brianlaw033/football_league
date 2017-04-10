class Game < ActiveRecord::Base
  has_many(:home_teams)
  has_many(:away_teams)
end
