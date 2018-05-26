require 'grape'

require './controller/contest_problem'

module Routes
  class ContestProblems < Grape::API
    namespace :contest_problem do
      post do
        process_request do
          Controller::ContestProblem.register_problem(params)
        end
      end

      get do
        process_request do
          Controller::ContestProblem.get_all
        end
      end

      namespace :problem do
        route_param :problem_name do
          get do
            process_request do
              Controller::ContestProblem.get_by_problem_name(params[:problem_name])
            end
          end
        end
      end

      namespace :contest do
        route_param :contest_name do
          get do
            process_request do
              Controller::ContestProblem.get_by_contest_name(params[:contest_name])
            end
          end
        end
      end
    end
  end
end
