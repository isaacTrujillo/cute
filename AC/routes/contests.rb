require 'grape'

require './controller/contest'

module Routes
  class Contests < Grape::API
    namespace :contest do

      post do
        process_request do
          Controller::Contest.create(params)
        end
      end

      get do
        process_request do
          Controller::Contest.get_all
        end
      end

      route_param :contest_name do

        get do
          process_request do
            Controller::Contest.get_by_name(params[:contest_name])
          end
        end

        route_param :user do
          post do
            process_request do
              Controller::Contest.register_user(params);
            end
          end
        end

      end
    end
  end
end
