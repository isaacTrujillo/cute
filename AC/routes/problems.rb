require 'grape'

require './controller/problem'

module Routes
  class Problems < Grape::API
    namespace :problem do

      post do
        process_request do
          Controller::Problem.create(params)
        end
      end

      get do
        process_request do
          Controller::Problem.get_all
        end
      end

      route_param :problem_name do

        get do
          process_request do
            Controller::Problem.get_by_name(params[:problem_name])
          end
        end

      end
    end
  end
end
