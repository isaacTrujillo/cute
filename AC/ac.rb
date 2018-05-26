require 'cute_logger'
require 'sequel'
require 'puma'
require 'ant'

require_relative 'lib/services'
require_relative 'routes/contests'
require_relative 'controller/contest'
require_relative 'routes/users'
require_relative 'controller/user'
require_relative 'routes/chats'
require_relative 'controller/chat'
require_relative 'routes/contest_users'
require_relative 'controller/contest_user'
require_relative 'routes/problems'
require_relative 'controller/problem'
require_relative 'routes/contest_problems'
require_relative 'controller/contest_problem'

class AC < Grape::API

  Controller::Contest.register(:database, Services.database[:contest])
  Controller::ContestUser.register(:database, Services.database[:contest_has_user])
  Controller::ContestProblem.register(:database, Services.database[:contest_has_problem])
  Controller::Problem.register(:database, Services.database[:problem])
  Controller::User.register(:database, Services.database[:user])
  Controller::Chat.register(:database, Services.database[:chat])

  version('v1', using: :header, vendor: :cut)
  prefix(:api)
  format(:json)

  helpers Ant::Server::Response
  mount Routes::Contests
  mount Routes::Users
  mount Routes::Chats
  mount Routes::ContestUsers
  mount Routes::ContestProblems
  mount Routes::Problems
end
