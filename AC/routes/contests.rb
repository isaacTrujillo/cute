require 'grape'

require './controller/contest'

Services.configure!
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

      end
    end
  end
end
