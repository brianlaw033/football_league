class Team < ActiveRecord::Base
  has_many(:players)
  has_many(:home_teams)
  has_many(:away_teams)
end
