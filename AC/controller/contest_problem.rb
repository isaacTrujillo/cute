require './lib/dependency_injector'

module Controller
  class ContestProblem
    extend DependencyInjector
    class << self

      def register_problem(data)
        resource(:database).insert(contest_name: data[:contest_name],problem_name: data[:problem_name])
        new(data[:contest_name],data[:problem_name])
      end

      def get_all()
        resource(:database).map { |data| from_database_record(data) }
      end

      def get_by_problem_name(problem_name)
        data = resource(:database).where(problem_name: problem_name).first
          from_database_record(data)
      end

      def get_by_contest_name(contest_name)
        data = resource(:database).where(contest_name: contest_name).first
          from_database_record(data)
      end

      private

      def from_database_record(data)
        new(data[:contest_name], data[:problem_name])
      end
    end

    def initialize(contest_name, problem_name)
      @contest_name = contest_name
      @problem_name = problem_name
    end

    def to_json(options)
      {
        contest_name: @contest_name,
        problem_name: @problem_name
      }.to_json(options)
    end
  end
end
