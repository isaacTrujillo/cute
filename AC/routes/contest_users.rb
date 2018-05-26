require 'grape'

require './controller/contest_user'

module Routes
  class ContestUsers < Grape::API
    namespace :contest_user do
      post do
        process_request do
          Controller::ContestUser.register_user(params)
        end
      end

      get do
        process_request do
          Controller::ContestUser.get_all
        end
      end

      namespace :user do
        route_param :user_name do
          get do
            process_request do
              Controller::ContestUser.get_by_user_name(params[:user_name])
            end
          end
        end
      end

      namespace :contest do
        route_param :contest_name do
          get do
            process_request do
              Controller::ContestUser.get_by_contest_name(params[:contest_name])
            end
          end
        end
      end
    end
  end
end
