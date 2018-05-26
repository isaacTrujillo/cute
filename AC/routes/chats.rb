require 'grape'

require './controller/chat'

module Routes
  class Chats < Grape::API
    namespace :chat do

      post do
        process_request do
          Controller::Chat.create(params)
        end
      end

      get do
        process_request do
          Controller::Chat.get_all
        end
      end

      route_param :id do

        get do
          process_request do
            Controller::Chat.get_by_id(params[:id])
          end
        end

      end
    end
  end
end
