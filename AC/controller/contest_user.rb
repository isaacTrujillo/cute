require './lib/dependency_injector'

module Controller
  class ContestUser
    extend DependencyInjector
    class << self

      def register_user(data)
        resource(:database).insert(contest_name: data[:contest_name],user_name: data[:user_name])
        new(data[:contest_name],data[:user_name])
      end

      def get_all()
        resource(:database).map { |data| from_database_record(data) }
      end

      def get_by_user_name(user_name)
        data = resource(:database).where(user_name: user_name).first
          from_database_record(data)
      end

      def get_by_contest_name(contest_name)
        data = resource(:database).where(contest_name: contest_name).first
          from_database_record(data)
      end

      private

      def from_database_record(data)
        new(data[:contest_name], data[:user_name])
      end
    end

    def initialize(contest_name, user_name)
      @contest_name = contest_name
      @user_name = user_name
    end

    def to_json(options)
      {
        contest_name: @contest_name,
        user_name: @user_name
      }.to_json(options)
    end
  end
end
