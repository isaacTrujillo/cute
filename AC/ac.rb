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

class AC < Grape::API

  Controller::Contest.register(:database, Services.database[:contest])
  Controller::User.register(:database, Services.database[:user])
  Controller::Chat.register(:database, Services.database[:chat])

  version('v1', using: :header, vendor: :cut)
  prefix(:api)
  format(:json)

  helpers Ant::Server::Response
  mount Routes::Contests
  mount Routes::Users
  mount Routes::Chats
end
