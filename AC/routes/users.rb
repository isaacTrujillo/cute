require 'grape'

require './controller/user'

Services.configure!
module Routes
  class Users < Grape::API
    namespace :user do

      post do
        process_request do
          Controller::User.create(params)
        end
      end

      get do
        process_request do
          Controller::User.get_all
        end
      end

      route_param :user_name do

        get do
          process_request do
            Controller::User.get_by_name(params[:user_name])
          end
        end

      end
    end
  end
end
